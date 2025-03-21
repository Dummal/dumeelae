output "control_tower_admin_role_arn" {
  description = "ARN of the Control Tower Admin IAM Role"
  value       = aws_iam_role.control_tower_admin_role.arn
}

output "aft_execution_role_arn" {
  description = "ARN of the AFT Execution IAM Role"
  value       = aws_iam_role.aft_execution_role.arn
}

output "aft_provisioning_role_arn" {
  description = "ARN of the AFT Provisioning IAM Role"
  value       = aws_iam_role.aft_provisioning_role.arn
}

output "aft_admin_role_arn" {
  description = "ARN of the AFT Admin IAM Role"
  value       = aws_iam_role.aft_admin_role.arn
}

output "control_tower_admin_policy_arn" {
  description = "ARN of the Control Tower Admin Policy"
  value       = aws_iam_policy.control_tower_admin_policy.arn
}

output "aft_execution_policy_arn" {
  description = "ARN of the AFT Execution Policy"
  value       = aws_iam_policy.aft_execution_policy.arn
}

output "aft_provisioning_policy_arn" {
  description = "ARN of the AFT Provisioning Policy"
  value       = aws_iam_policy.aft_provisioning_policy.arn
}

output "aft_admin_policy_arn" {
  description = "ARN of the AFT Admin Policy"
  value       = aws_iam_policy.aft_admin_policy.arn
}