aws_region = "us-west-2"
enable_control_tower = true
master_account_email = "master@example.com"
master_account_id = "123456789012"
organizational_units = ["Security", "Audit Log", "Sandbox"]
dev_account_email = "dev@example.com"
prod_account_email = "prod@example.com"
shared_account_email = "shared@example.com"
security_account_email = "security@example.com"
audit_account_email = "audit@example.com"
aft_logs_bucket_name = "aft-logs-bucket-863518414447"
tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
}