resource "aws_subnet" "subnets" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = var.type == "public" ? true : false
  ipv6_cidr_block   = var.ipv6_enabled ? var.ipv6_cidr_block : null

  tags = merge(
    var.common_tags,
    {
      Name = "${var.type}-subnet-${count.index + 1}"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  count = var.type == "public" ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "Internet-Gateway"
    }
  )
}

resource "aws_route_table" "public_route_table" {
  count = var.type == "public" ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "Public-Route-Table"
    }
  )
}

resource "aws_route" "public_route" {
  count = var.type == "public" ? 1 : 0
  route_table_id         = aws_route_table.public_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[0].id
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = var.type == "public" ? length(var.azs) : 0
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.public_route_table[0].id
}

resource "aws_nat_gateway" "nat" {
  count = var.type == "private" && var.nat_enabled ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.subnets[0].id

  tags = merge(
    var.common_tags,
    {
      Name = "NAT-Gateway"
    }
  )
}

resource "aws_eip" "nat" {
  count = var.type == "private" && var.nat_enabled ? 1 : 0
  tags = merge(
    var.common_tags,
    {
      Name = "NAT-EIP"
    }
  )
}

resource "aws_route_table" "private_route_table" {
  count = var.type == "private" ? length(var.azs) : 0
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "Private-Route-Table-${count.index + 1}"
    }
  )
}

resource "aws_route" "private_route" {
  count = var.type == "private" && var.nat_enabled ? length(var.azs) : 0
  route_table_id         = aws_route_table.private_route_table[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = var.type == "private" ? length(var.azs) : 0
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}

resource "aws_network_acl" "network_acl" {
  count = var.network_acl_id != "" ? 0 : 1
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "Network-ACL"
    }
  )
}

resource "aws_network_acl_rule" "network_acl_rules" {
  count = var.network_acl_id != "" ? 0 : length(var.acl_rules)
  network_acl_id = aws_network_acl.network_acl[0].id
  rule_number    = var.acl_rules[count.index].rule_number
  protocol       = var.acl_rules[count.index].protocol
  rule_action    = var.acl_rules[count.index].rule_action
  cidr_block     = var.acl_rules[count.index].cidr_block
  from_port      = var.acl_rules[count.index].from_port
  to_port        = var.acl_rules[count.index].to_port
  egress         = var.acl_rules[count.index].egress
}