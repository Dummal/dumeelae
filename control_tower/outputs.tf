output "control_tower_role_arn" {
  value       = aws_iam_role.control_tower_role.arn
  description = "ARN of the Control Tower IAM Role."
}

output "control_tower_policy_arn" {
  value       = aws_iam_policy.control_tower_policy.arn
  description = "ARN of the Control Tower IAM Policy."
}

output "gdpr_compliance_rule_id" {
  value       = aws_config_config_rule.gdpr_compliance_rule.id
  description = "ID of the GDPR compliance AWS Config Rule."
}

output "control_tower_secret_arn" {
  value       = aws_secretsmanager_secret.control_tower_secret.arn
  description = "ARN of the Control Tower Secret."
}