output "control_tower_role_arn" {
  description = "The ARN of the Control Tower IAM role"
  value       = aws_iam_role.control_tower_role.arn
}

output "control_tower_policy_arn" {
  description = "The ARN of the Control Tower IAM policy"
  value       = aws_iam_policy.control_tower_policy.arn
}

output "allowed_regions" {
  description = "List of allowed AWS regions"
  value       = var.allowed_regions
}

output "data_residency" {
  description = "Data residency requirement"
  value       = var.data_residency
}

output "compliance_frameworks" {
  description = "Compliance frameworks enforced"
  value       = var.compliance_frameworks
}