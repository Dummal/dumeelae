region                  = "us-east-1"
backend_bucket          = "my-terraform-backend"
backend_key             = "state/multi-account-setup.tfstate"
backend_region          = "us-east-1"
backend_dynamodb_table  = "terraform-locks"
account_id              = "123456789012"
management_account_id   = "123456789012"
member_accounts         = ["234567890123", "345678901234"]
```

---

### IAM Module Files

#### `# FILE: modules/iam/main.tf`
```hcl