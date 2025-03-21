output "organization_id" {
  description = "The ID of the AWS Organization"
  value       = aws_organizations_organization.org.id
}

output "control_tower_role_arn" {
  description = "ARN of the IAM role for Control Tower"
  value       = aws_iam_role.control_tower_role.arn
}

output "control_tower_policy_arn" {
  description = "ARN of the IAM policy for Control Tower"
  value       = aws_iam_policy.control_tower_policy.arn
}

output "config_recorder_name" {
  description = "Name of the AWS Config configuration recorder"
  value       = aws_config_configuration_recorder.config_recorder.name
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts"
  value       = aws_sns_topic.alerts_topic.arn
}

output "dns_zone_id" {
  description = "ID of the Route 53 DNS zone"
  value       = aws_route53_zone.dns_zone.zone_id
}

output "kms_key_arn" {
  description = "ARN of the KMS key used for encryption"
  value       = aws_kms_key.encryption_key.arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket used for data retention"
  value       = aws_s3_bucket.data_retention_bucket.bucket
}