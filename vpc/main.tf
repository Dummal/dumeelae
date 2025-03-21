provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge({ "Name" = "${var.environment}-vpc" }, var.tags)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge({ "Name" = "${var.environment}-igw" }, var.tags)
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)
  tags                    = merge({ "Name" = "${var.environment}-public-subnet-${count.index + 1}" }, var.tags)
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = element(var.availability_zones, count.index)
  tags              = merge({ "Name" = "${var.environment}-private-subnet-${count.index + 1}" }, var.tags)
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = merge({ "Name" = "${var.environment}-public-rt" }, var.tags)
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0
  tags  = merge({ "Name" = "${var.environment}-nat-eip" }, var.tags)
}

resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id
  tags          = merge({ "Name" = "${var.environment}-nat-gateway" }, var.tags)
}

resource "aws_route_table" "private" {
  count  = var.enable_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags   = merge({ "Name" = "${var.environment}-private-rt" }, var.tags)
}

resource "aws_route" "private_nat_access" {
  count                  = var.enable_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.private[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}

resource "aws_route_table_association" "private" {
  count          = var.enable_nat_gateway ? length(aws_subnet.private) : 0
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.s3"
  tags         = merge({ "Name" = "${var.environment}-s3-endpoint" }, var.tags)
}

resource "aws_flow_log" "vpc" {
  vpc_id              = aws_vpc.main.id
  log_destination     = aws_s3_bucket.aft_logs.arn
  log_destination_type = "s3"
  traffic_type        = "ALL"
  tags                = merge({ "Name" = "${var.environment}-vpc-flow-log" }, var.tags)
}

resource "aws_s3_bucket" "aft_logs" {
  bucket = var.aft_logs_bucket_name
  acl    = "log-delivery-write"
  tags   = merge({ "Name" = "${var.environment}-aft-logs" }, var.tags)
}