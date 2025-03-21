output "control_tower_policy_arn" {
  value       = aws_iam_policy.control_tower_policy.arn
  description = "ARN of the Control Tower IAM Policy."
}

output "control_tower_role_arn" {
  value       = aws_iam_role.control_tower_role.arn
  description = "ARN of the Control Tower IAM Role."
}

output "allowed_regions" {
  value       = var.allowed_regions
  description = "Regions where resources are allowed to be created."
}

output "data_residency_region" {
  value       = var.data_residency_region
  description = "Region for data residency compliance."
}

output "vpn_enabled" {
  value       = var.enable_vpn
  description = "Indicates if VPN connectivity is enabled."
}

output "siem_integration_enabled" {
  value       = var.enable_siem_integration
  description = "Indicates if SIEM integration is enabled."
}