resource "aws_subnet" "subnets" {
  count             = length(var.subnet_configs)
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_configs[count.index].cidr_block
  availability_zone = var.subnet_configs[count.index].availability_zone
  map_public_ip_on_launch = var.subnet_configs[count.index].type == "public" ? true : false

  tags = merge(
    {
      Name = "${var.subnet_configs[count.index].type}-subnet-${count.index}"
    },
    var.common_tags
  )
}

resource "aws_route_table" "public_rt" {
  count = var.create_public_subnets ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name = "public-route-table"
    },
    var.common_tags
  )
}

resource "aws_route_table" "private_rt" {
  count = var.create_private_subnets ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name = "private-route-table"
    },
    var.common_tags
  )
}

resource "aws_route" "public_route" {
  count                  = var.create_public_subnets ? 1 : 0
  route_table_id         = aws_route_table.public_rt[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway_id
}

resource "aws_route" "private_route" {
  count                  = var.create_private_subnets ? 1 : 0
  route_table_id         = aws_route_table.private_rt[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

resource "aws_route_table_association" "public_associations" {
  count          = var.create_public_subnets ? length(var.subnet_configs) : 0
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.public_rt[0].id
}

resource "aws_route_table_association" "private_associations" {
  count          = var.create_private_subnets ? length(var.subnet_configs) : 0
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.private_rt[0].id
}

resource "aws_network_acl" "acl" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name = "network-acl"
    },
    var.common_tags
  )
}

resource "aws_network_acl_rule" "acl_rules" {
  count = length(var.acl_rules)
  network_acl_id = aws_network_acl.acl.id
  rule_number    = var.acl_rules[count.index].rule_number
  protocol       = var.acl_rules[count.index].protocol
  rule_action    = var.acl_rules[count.index].action
  cidr_block     = var.acl_rules[count.index].cidr_block
  from_port      = var.acl_rules[count.index].from_port
  to_port        = var.acl_rules[count.index].to_port
  egress         = var.acl_rules[count.index].egress
}