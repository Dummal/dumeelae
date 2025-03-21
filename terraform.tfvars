master_account_id       = "123456789631"
enable_control_tower    = true
master_account_email    = "ghyut@fggg.io"
organizational_units    = { development = "ou-xxxx-yyyy" }
aws_region              = "us-east-2"
aft_logs_bucket_name    = "development"
public_vpc_cidr         = "10.0.0.0/16"
public_subnet_cidr      = "10.0.1.0/24"
private_vpc_cidr        = "10.0.2.0/16"
private_subnet_cidr     = "10.0.3.0/24"
aws_availability_zone   = "us-east-2a"
vpc_id                  = "vpc-xxxx"
cidr_block              = "10.0.4.0/24"
availability_zone       = "us-east-2a"
map_public_ip_on_launch = true
tags                    = { Environment = "Development", Project = "LandingZone" }