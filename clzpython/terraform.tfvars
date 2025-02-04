backend_bucket           = "my-terraform-backend"
backend_key              = "multi-account-setup/terraform.tfstate"
backend_region           = "us-east-1"
backend_dynamodb_table   = "terraform-lock-table"

management_account_region = "us-east-1"
management_account_profile = "management-account"

member_account_region = "us-west-2"
member_account_profile = "member-account"
```

---

### IAM Module Files

#### `# FILE: modules/iam/main.tf`
```hcl