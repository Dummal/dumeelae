resource "aws_subnet" "subnet" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_blocks[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = var.type == "public" ? true : false
  tags = merge(
    var.tags,
    {
      Name = "${var.type}-subnet-${count.index + 1}"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  count = var.type == "public" ? 1 : 0
  vpc_id = var.vpc_id
  tags = merge(
    var.tags,
    {
      Name = "Internet-Gateway"
    }
  )
}

resource "aws_route_table" "public_route_table" {
  count = var.type == "public" ? 1 : 0
  vpc_id = var.vpc_id
  tags = merge(
    var.tags,
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

resource "aws_route_table_association" "public_route_table_association" {
  count = var.type == "public" ? length(var.azs) : 0
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.public_route_table[0].id
}

resource "aws_nat_gateway" "nat_gateway" {
  count = var.type == "private" && var.nat_enabled ? 1 : 0
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.subnet[0].id
  tags = merge(
    var.tags,
    {
      Name = "NAT-Gateway"
    }
  )
}

resource "aws_eip" "nat_eip" {
  count = var.type == "private" && var.nat_enabled ? 1 : 0
  vpc = true
}

resource "aws_route_table" "private_route_table" {
  count = var.type == "private" ? 1 : 0
  vpc_id = var.vpc_id
  tags = merge(
    var.tags,
    {
      Name = "Private-Route-Table"
    }
  )
}

resource "aws_route" "private_route" {
  count = var.type == "private" && var.nat_enabled ? 1 : 0
  route_table_id         = aws_route_table.private_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway[0].id
}

resource "aws_route_table_association" "private_route_table_association" {
  count = var.type == "private" ? length(var.azs) : 0
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.private_route_table[0].id
}

resource "aws_network_acl" "network_acl" {
  count = var.network_acl_id != "" ? 1 : 0
  vpc_id = var.vpc_id
  tags = merge(
    var.tags,
    {
      Name = "Network-ACL"
    }
  )
}

resource "aws_network_acl_rule" "network_acl_rule" {
  count = var.network_acl_id != "" ? length(var.network_acl_rules) : 0
  network_acl_id = aws_network_acl.network_acl[0].id
  rule_number    = var.network_acl_rules[count.index].rule_number
  protocol       = var.network_acl_rules[count.index].protocol
  rule_action    = var.network_acl_rules[count.index].rule_action
  cidr_block     = var.network_acl_rules[count.index].cidr_block
  from_port      = var.network_acl_rules[count.index].from_port
  to_port        = var.network_acl_rules[count.index].to_port
}