output "organization_id" {
  value       = aws_organizations_organization.org.id
  description = "The ID of the AWS Organization."
}

output "root_id" {
  value       = aws_organizations_organization.org.roots[0].id
  description = "The ID of the root in the AWS Organization."
}

output "security_ou_id" {
  value       = module.control_tower.security_ou_id
  description = "The ID of the Security Organizational Unit."
}

output "audit_ou_id" {
  value       = module.control_tower.audit_ou_id
  description = "The ID of the Audit Log Organizational Unit."
}

output "sandbox_ou_id" {
  value       = module.control_tower.sandbox_ou_id
  description = "The ID of the Sandbox Organizational Unit."
}

output "s3_bucket_id" {
  value       = module.aws_resources.s3_bucket_id
  description = "The ID of the S3 bucket created for AFT logs."
}

output "kms_key_arn" {
  value       = module.aws_resources.kms_key_arn
  description = "The ARN of the KMS key used for encryption."
}

output "sns_topic_arn" {
  value       = module.aws_resources.sns_topic_arn
  description = "The ARN of the SNS topic for notifications."
}

output "dynamodb_table_name" {
  value       = module.aws_resources.dynamodb_table_name
  description = "The name of the DynamoDB table for AFT requests."
}

output "cloudwatch_log_group_name" {
  value       = module.aws_resources.cloudwatch_log_group_name
  description = "The name of the CloudWatch Log Group for AFT logs."
}

output "dev_account_id" {
  value       = module.control_tower.dev_account_id
  description = "The account ID of the Dev account."
}

output "prod_account_id" {
  value       = module.control_tower.prod_account_id
  description = "The account ID of the Prod account."
}

output "shared_account_id" {
  value       = module.control_tower.shared_account_id
  description = "The account ID of the Shared account."
}

output "aft_execution_role_arn" {
  value       = module.iam.aft_execution_role_arn
  description = "The ARN of the AFT execution role."
}

output "aft_account_provisioning_role_arn" {
  value       = module.iam.aft_account_provisioning_role_arn
  description = "The ARN of the AFT account provisioning role."
}

output "aft_admin_role_arn" {
  value       = module.iam.aft_admin_role_arn
  description = "The ARN of the AFT admin role."
}