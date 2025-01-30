
output "aft_logs_bucket_id" {
  description = "ID of the AFT logs S3 bucket"
  value       = aws_s3_bucket.aft_logs.id
}

output "aft_kms_key_arn" {
  description = "ARN of the KMS key for AFT encryption"
  value       = aws_kms_key.aft_key.arn
}

output "aft_sns_topic_arn" {
  description = "ARN of the AFT notifications SNS topic"
  value       = aws_sns_topic.aft_notifications.arn
}

output "aft_request_table_name" {
  description = "Name of the AFT request DynamoDB table"
  value       = aws_dynamodb_table.aft_request.name
}

# Add more outputs as needed for your specific use case
