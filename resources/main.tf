```hcl
provider "aws" {
  region = var.aws_region
}

module "control_tower" {
  source             = "terraform-aws-modules/control-tower/aws"
  master_account_id  = var.master_account_id
  master_account_email = var.master_account_email
  organizational_units = var.organizational_units
  shared_account_emails = var.shared_account_emails
  security_account_email = var.security_account_email
  audit_account_email = var.audit_account_email
  aft_logs_bucket_name = var.aft_logs_bucket_name
  tags                = var.common_tags
}

module "vpc" {
  source           = "terraform-aws-modules/vpc/aws"
  name             = var.vpc_name
  cidr             = var.vpc_cidr_block
  azs              = var.availability_zones
  public_subnets   = var.public_subnet_cidrs
  private_subnets  = var.private_subnet_cidrs
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags             = var.common_tags

  public_subnet_tags = {
    "Tier" = "Public"
  }

  private_subnet_tags = {
    "Tier" = "Private"
  }

  create_igw        = var.create_internet_gateway
  create_public_route_table = var.create_public_route_table
  create_private_route_table = var.create_private_route_table
}

resource "aws_eip" "public_subnet_ips" {
  count = var.elastic_ips_count
  vpc   = true
  tags  = var.common_tags
}
```