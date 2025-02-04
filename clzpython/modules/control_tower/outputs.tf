output "account_ids" {
  value = [for acc in aws_organizations_account.accounts : acc.id]
}
```

---

### Example Usage

To use this setup, you can define the `terraform.tfvars` file with the required values, such as:

```hcl
backend_bucket           = "my-terraform-backend"
backend_key              = "multi-account-setup/terraform.tfstate"
backend_region           = "us-east-1"
backend_dynamodb_table   = "terraform-lock-table"

account_names = {
  "DevAccount"  = "dev@example.com"
  "ProdAccount" = "prod@example.com"
}
```

This configuration will create a multi-account AWS setup with IAM roles, a VPC, and AWS Control Tower accounts.