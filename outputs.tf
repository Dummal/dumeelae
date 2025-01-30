output "organization_id" {
  description = "The ID of the AWS Organization"
  value       = module.control_tower.organization_id
}

output "organization_root_id" {
  description = "The ID of the root of the AWS Organization"
  value       = module.control_tower.organization_root_id
}

output "security_ou_id" {
  description = "The ID of the Security organizational unit"
  value       = module.control_tower.security_ou_id
}

output "audit_log_ou_id" {
  description = "The ID of the Audit Log organizational unit"
  value       = module.control_tower.audit_log_ou_id
}

output "aft_execution_role_arn" {
  description = "ARN of the AFT execution role"
  value       = module.iam.aft_execution_role_arn
}

output "aft_account_provisioning_role_arn" {
  description = "ARN of the AFT account provisioning role"
  value       = module.iam.aft_account_provisioning_role_arn
}

output "aft_logs_bucket_id" {
  description = "ID of the AFT logs S3 bucket"
  value       = module.aws_resources.aft_logs_bucket_id
}

output "aft_kms_key_arn" {
  description = "ARN of the KMS key for AFT encryption"
  value       = module.aws_resources.aft_kms_key_arn
}

output "aft_sns_topic_arn" {
  description = "ARN of the AFT notifications SNS topic"
  value       = module.aws_resources.aft_sns_topic_arn
}

output "aft_request_table_name" {
  description = "Name of the AFT request DynamoDB table"
  value       = module.aws_resources.aft_request_table_name
}

output "dev_account_id" {
  description = "The ID of the Dev account"
  value       = aws_organizations_account.dev.id
}

output "prod_account_id" {
  description = "The ID of the Prod account"
  value       = aws_organizations_account.prod.id
}

output "shared_account_id" {
  description = "The ID of the Shared account"
  value       = aws_organizations_account.shared.id
}
