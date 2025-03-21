```hcl
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "aft_logs_bucket_arn" {
  description = "ARN of the S3 bucket for AFT logs"
  value       = aws_s3_bucket.aft_logs.arn
}
```