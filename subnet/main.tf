resource "aws_subnet" "subnets" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr_block, var.subnet_size, count.index)
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = var.type == "public" ? true : false
  ipv6_cidr_block         = var.ipv6_enabled ? var.ipv6_cidr_block : null
  assign_ipv6_address_on_creation = var.ipv6_enabled ? true : false
  tags = merge(
    {
      Name = "${var.type}-subnet-${count.index}"
    },
    var.common_tags
  )
}

resource "aws_route_table" "route_tables" {
  count   = length(var.azs)
  vpc_id  = var.vpc_id
  tags    = merge({ Name = "${var.type}-route-table-${count.index}" }, var.common_tags)
}

resource "aws_route" "routes" {
  count = length(var.azs)
  route_table_id = aws_route_table.route_tables[count.index].id
  destination_cidr_block = var.type == "public" ? "0.0.0.0/0" : null
  gateway_id = var.type == "public" ? aws_internet_gateway.igw.id : null

  destination_cidr_block = var.type == "private" ? "0.0.0.0/0" : null
  nat_gateway_id = var.type == "private" && var.nat_enabled ? aws_nat_gateway.natgw[count.index].id : null
}

resource "aws_internet_gateway" "igw" {
  count = var.type == "public" ? 1 : 0
  vpc_id = var.vpc_id
  tags = merge({ Name = "InternetGateway" }, var.common_tags)
}

resource "aws_nat_gateway" "natgw" {
  count          = var.type == "private" && var.nat_enabled ? length(var.azs) : 0
  allocation_id  = aws_eip.nat_eip[count.index].id
  subnet_id      = aws_subnet.subnets[count.index].id
  tags           = merge({ Name = "NATGateway-${count.index}" }, var.common_tags)
}

resource "aws_eip" "nat_eip" {
  count = var.type == "private" && var.nat_enabled ? length(var.azs) : 0
  tags  = merge({ Name = "ElasticIP-${count.index}" }, var.common_tags)
}

resource "aws_network_acl" "network_acl" {
  vpc_id = var.vpc_id
  tags   = merge({ Name = "NetworkACL" }, var.common_tags)
}

resource "aws_network_acl_rule" "network_acl_rules" {
  count          = length(var.network_acl_rules)
  network_acl_id = aws_network_acl.network_acl.id
  rule_number    = var.network_acl_rules[count.index].rule_number
  protocol       = var.network_acl_rules[count.index].protocol
  rule_action    = var.network_acl_rules[count.index].action
  cidr_block     = var.network_acl_rules[count.index].cidr_block
  ipv6_cidr_block = var.network_acl_rules[count.index].ipv6_cidr_block
  egress         = var.network_acl_rules[count.index].egress
}