output "account_id" {
  description = "ID of the newly created AWS account"
  value       = aws_organizations_account.new_account.id
}

output "kms_key_arn" {
  description = "ARN of the KMS key used for encryption"
  value       = aws_kms_key.control_tower_kms_key.arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts"
  value       = aws_sns_topic.alerts_topic.arn
}

output "route53_zone_id" {
  description = "ID of the Route 53 hosted zone"
  value       = aws_route53_zone.dns_management_zone.zone_id
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for data retention"
  value       = aws_s3_bucket.data_retention_bucket.bucket
}