output "management_bucket_arn" {
  description = "ARN of the S3 bucket in the management account"
  value       = aws_s3_bucket.management_bucket.arn
}

output "dev_bucket_arn" {
  description = "ARN of the S3 bucket in the dev account"
  value       = aws_s3_bucket.dev_bucket.arn
}

output "prod_bucket_arn" {
  description = "ARN of the S3 bucket in the prod account"
  value       = aws_s3_bucket.prod_bucket.arn
}
```

---

#### # FILE: provider.tf
```hcl