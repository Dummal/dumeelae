```hcl
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.landing_zone_vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.landing_zone_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.landing_zone_vpc.private_subnet_ids
}

output "aft_logs_bucket_arn" {
  description = "ARN of the AFT logs S3 bucket"
  value       = aws_s3_bucket.aft_logs.arn
}

output "development_account_id" {
  description = "Account ID of the Development organizational unit"
  value       = aws_organizations_account.development_account.id
}

output "secure_access_role_arn" {
  description = "ARN of the Secure Access IAM Role"
  value       = aws_iam_role.secure_access_role.arn
}
```