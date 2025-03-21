output "account_id" {
  description = "The ID of the newly created AWS account."
  value       = aws_organizations_account.new_account.id
}

output "cross_account_role_arn" {
  description = "The ARN of the cross-account IAM role."
  value       = aws_iam_role.cross_account_role.arn
}

output "vpn_connection_id" {
  description = "The ID of the VPN connection."
  value       = aws_vpn_connection.vpn.id
}

output "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone."
  value       = aws_route53_zone.dns_zone.zone_id
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic for alerts."
  value       = aws_sns_topic.alerts.arn
}

output "secretsmanager_arn" {
  description = "The ARN of the Secrets Manager secret."
  value       = aws_secretsmanager_secret.secrets.arn
}