module "subnets" {
  source = "./modules/subnets"

  vpc_id              = var.vpc_id
  cidr_block          = var.cidr_block
  ipv6_enabled        = var.ipv6_enabled
  ipv6_cidr_block     = var.ipv6_cidr_block
  availability_zones  = var.availability_zones
  type                = var.type
  nat_gateway_enabled = var.nat_gateway_enabled
  network_acl_id      = var.network_acl_id
  common_tags         = var.common_tags
}

resource "aws_subnet" "subnets" {
  count = length(var.availability_zones)

  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = var.type == "public" ? true : false

  tags = merge(var.common_tags, {
    Name = "${var.type}-subnet-${count.index}"
  })
}

resource "aws_route_table" "route_table" {
  count = var.type == "public" ? 1 : length(var.availability_zones)

  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "${var.type}-route-table-${count.index}"
  })
}

resource "aws_route" "route" {
  count = var.type == "public" ? 1 : length(var.availability_zones)

  route_table_id = aws_route_table.route_table[count.index]

  destination_cidr_block = var.type == "public" ? "0.0.0.0/0" : "0.0.0.0/0"
  gateway_id = var.type == "public" ? aws_internet_gateway.igw.id : aws_nat_gateway.natgw.id
}

resource "aws_internet_gateway" "igw" {
  count = var.type == "public" ? 1 : 0

  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "Internet-Gateway"
  })
}

resource "aws_nat_gateway" "natgw" {
  count = var.type == "private" && var.nat_gateway_enabled ? length(var.availability_zones) : 0

  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.subnets[count.index].id

  tags = merge(var.common_tags, {
    Name = "NAT-Gateway-${count.index}"
  })
}

resource "aws_eip" "nat_eip" {
  count = var.type == "private" && var.nat_gateway_enabled ? length(var.availability_zones) : 0

  tags = merge(var.common_tags, {
    Name = "NAT-EIP-${count.index}"
  })
}

resource "aws_network_acl" "network_acl" {
  count = var.network_acl_id != null ? 0 : 1

  vpc_id = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "Network-ACL"
  })
}

resource "aws_network_acl_rule" "network_acl_rule" {
  count = var.network_acl_id != null ? 0 : 2

  network_acl_id = aws_network_acl.network_acl.id
  rule_number    = count.index + 1
  protocol       = "-1"
  action         = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}

output "route_table_ids" {
  value = aws_route_table.route_table[*].id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.natgw[*].id
}