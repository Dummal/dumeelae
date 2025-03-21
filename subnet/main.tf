resource "aws_subnet" "subnets" {
  for_each           = var.subnet_config
  vpc_id             = var.vpc_id
  cidr_block         = each.value.cidr_block
  availability_zone  = each.value.az
  map_public_ip_on_launch = each.value.type == "public" ? true : false
  ipv6_cidr_block    = var.ipv6_enabled ? each.value.ipv6_cidr_block : null
  assign_ipv6_address_on_creation = var.ipv6_enabled ? true : false
  tags = merge(
    var.common_tags,
    {
      "Name" = each.value.name
    }
  )
}

resource "aws_route_table" "route_tables" {
  for_each = { for k, v in var.subnet_config : k => v if v.type == "private" || v.type == "public" }
  vpc_id   = var.vpc_id
  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.value.name}-route-table"
    }
  )
}

resource "aws_route_table_association" "route_table_associations" {
  for_each       = aws_subnet.subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.route_tables[each.key].id
}

resource "aws_route" "public_routes" {
  for_each = { for k, v in var.subnet_config : k => v if v.type == "public" }
  route_table_id         = aws_route_table.route_tables[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "private_routes" {
  for_each = { for k, v in var.subnet_config : k => v if v.type == "private" }
  route_table_id         = aws_route_table.route_tables[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags   = var.common_tags
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets[var.public_subnet_key].id
  tags          = var.common_tags
}

resource "aws_eip" "nat_eip" {
  vpc = true
  tags = merge(
    var.common_tags,
    {
      "Name" = "NAT EIP"
    }
  )
}

resource "aws_network_acl" "network_acl" {
  for_each = var.network_acl_id != null ? { "acl" = var.network_acl_id } : {}
  vpc_id   = var.vpc_id
  tags     = var.common_tags
}

resource "aws_network_acl_rule" "acl_rule" {
  for_each = var.network_acl_rules
  network_acl_id = aws_network_acl.network_acl.id
  rule_number    = each.value.rule_number
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  egress         = each.value.egress
  cidr_block     = each.value.cidr_block
  ipv6_cidr_block = each.value.ipv6_cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}