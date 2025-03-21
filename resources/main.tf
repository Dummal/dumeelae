```hcl
provider "aws" {
  region = var.region
}

module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr_block          = var.vpc_cidr_block
  availability_zones      = var.availability_zones
  public_subnet_cidrs     = var.public_subnet_cidrs
  private_subnet_cidrs    = var.private_subnet_cidrs
  enable_nat_gateway      = var.enable_nat_gateway
  enable_internet_gateway = var.enable_internet_gateway
  elastic_ips_count       = var.elastic_ips_count
  common_tags             = var.common_tags
}

module "control_tower" {
  source                 = "./modules/control_tower"
  master_account_id      = var.master_account_id
  master_account_email   = var.master_account_email
  organizational_units   = var.organizational_units
  ou_emails              = var.ou_emails
  security_audit_emails  = var.security_audit_emails
  aft_logs_bucket_name   = var.aft_logs_bucket_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
```