variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "master_account_id" {
  description = "The AWS account ID of the master account"
  type        = string
}

# Add more variables as needed for your specific use case
