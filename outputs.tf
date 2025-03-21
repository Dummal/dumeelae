output "iam_role_arn" {
  description = "The ARN of the IAM role created."
  value       = module.iam.iam_role_arn
}

output "control_tower_status" {
  description = "Status of AWS Control Tower setup."
  value       = module.control_tower.control_tower_status
}

output "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs."
  value       = module.resources.aft_logs_bucket_name
}

output "vpc_id" {
  description = "ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of the created subnets."
  value       = module.subnet.subnet_ids
}