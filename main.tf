# AWS Control Tower Landing Zone Setup with AFT

module "control_tower" {
  source = "./modules/control_tower"

  enable_control_tower  = var.enable_control_tower
  master_account_email  = var.master_account_email
  organizational_units  = var.organizational_units
  aws_region            = var.aws_region
}

module "iam" {
  source = "./modules/iam"
  master_account_id = var.master_account_id
}

module "aws_resources" {
  source = "./modules/aws_resources"

  aft_logs_bucket_name = var.aft_logs_bucket_name
  aws_region           = var.aws_region
  master_account_id    = var.master_account_id
}

# Create Dev Account
resource "aws_organizations_account" "dev" {
  name      = "Dev Account"
  email     = var.dev_account_email
  parent_id = module.control_tower.security_ou_id
}

# Create Prod Account
resource "aws_organizations_account" "prod" {
  name      = "Prod Account"
  email     = var.prod_account_email
  parent_id = module.control_tower.security_ou_id
}

# Create Shared Account
resource "aws_organizations_account" "shared" {
  name      = "Shared Account"
  email     = var.shared_account_email
  parent_id = module.control_tower.security_ou_id
}

# Outputs are defined in outputs.tf
