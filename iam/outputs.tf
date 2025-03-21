output "control_tower_admin_role_arn" {
  description = "ARN of the Control Tower Admin Role"
  value       = aws_iam_role.control_tower_admin_role.arn
}

output "aft_execution_role_arn" {
  description = "ARN of the AFT Execution Role"
  value       = aws_iam_role.aft_execution_role.arn
}

output "aft_account_provisioning_role_arn" {
  description = "ARN of the AFT Account Provisioning Role"
  value       = aws_iam_role.aft_account_provisioning_role.arn
}

output "aft_admin_role_arn" {
  description = "ARN of the AFT Admin Role"
  value       = aws_iam_role.aft_admin_role.arn
}

output "control_tower_admin_role_name" {
  description = "Name of the Control Tower Admin Role"
  value       = aws_iam_role.control_tower_admin_role.name
}

output "aft_execution_role_name" {
  description = "Name of the AFT Execution Role"
  value       = aws_iam_role.aft_execution_role.name
}

output "aft_account_provisioning_role_name" {
  description = "Name of the AFT Account Provisioning Role"
  value       = aws_iam_role.aft_account_provisioning_role.name
}

output "aft_admin_role_name" {
  description = "Name of the AFT Admin Role"
  value       = aws_iam_role.aft_admin_role.name
}