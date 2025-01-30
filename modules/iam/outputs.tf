output "aft_execution_role_arn" {
  description = "ARN of the AFT execution role"
  value       = aws_iam_role.aft_execution_role.arn
}

output "aft_account_provisioning_role_arn" {
  description = "ARN of the AFT account provisioning role"
  value       = aws_iam_role.aft_account_provisioning_role.arn
}

# Add more outputs as needed for your specific use case
