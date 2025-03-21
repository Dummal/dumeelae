output "iam_role_arn" {
  description = "ARN of the IAM role created by the IAM module."
  value       = module.iam.role_arn
}

output "control_tower_status" {
  description = "Status of the AWS Control Tower setup."
  value       = module.control_tower.status
}

output "aft_logs_bucket_arn" {
  description = "ARN of the S3 bucket for AFT logs."
  value       = module.resources.aft_logs_bucket_arn
}

output "vpc_id" {
  description = "ID of the VPC created."
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "List of subnet IDs created."
  value       = module.subnet.subnet_ids
}