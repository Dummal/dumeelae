resource "aws_subnet" "subnets" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = var.type == "public" ? true : false
  ipv6_cidr_block   = var.ipv6_enabled ? var.ipv6_cidr_block : null
  assign_ipv6_address_on_creation = var.ipv6_enabled

  tags = merge(var.common_tags, {
    Name = "${var.type}-subnet-${count.index}"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "Internet-Gateway"
  })
}

resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "Public-Route-Table"
  })
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = var.type == "public" ? length(var.azs) : 0
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_nat_gateway" "nat" {
  count          = var.type == "private" ? length(var.azs) : 0
  allocation_id  = aws_eip.nat[count.index].id
  subnet_id      = aws_subnet.subnets[count.index].id

  tags = merge(var.common_tags, {
    Name = "NAT-Gateway-${count.index}"
  })
}

resource "aws_eip" "nat" {
  count = var.type == "private" ? length(var.azs) : 0
}

resource "aws_route_table" "private_route_table" {
  count  = var.type == "private" ? length(var.azs) : 0
  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "Private-Route-Table-${count.index}"
  })
}

resource "aws_route" "private_route" {
  count                   = var.type == "private" ? length(var.azs) : 0
  route_table_id          = aws_route_table.private_route_table[count.index].id
  destination_cidr_block  = "0.0.0.0/0"
  nat_gateway_id          = aws_nat_gateway.nat[count.index].id
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = var.type == "private" ? length(var.azs) : 0
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}

resource "aws_network_acl" "network_acl" {
  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "Network-ACL"
  })
}

resource "aws_network_acl_rule" "ingress" {
  count              = length(var.network_acl_rules)
  network_acl_id     = aws_network_acl.network_acl.id
  rule_number        = var.network_acl_rules[count.index].rule_number
  protocol           = var.network_acl_rules[count.index].protocol
  rule_action        = var.network_acl_rules[count.index].rule_action
  cidr_block         = var.network_acl_rules[count.index].cidr_block
  from_port          = var.network_acl_rules[count.index].from_port
  to_port            = var.network_acl_rules[count.index].to_port
}

resource "aws_network_acl_rule" "egress" {
  count              = length(var.network_acl_rules)
  network_acl_id     = aws_network_acl.network_acl.id
  rule_number        = var.network_acl_rules[count.index].rule_number
  protocol           = var.network_acl_rules[count.index].protocol
  rule_action        = var.network_acl_rules[count.index].rule_action
  cidr_block         = var.network_acl_rules[count.index].cidr_block
  from_port          = var.network_acl_rules[count.index].from_port
  to_port            = var.network_acl_rules[count.index].to_port
}