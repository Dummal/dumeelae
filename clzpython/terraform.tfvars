region                  = "us-east-1"
account_id              = "123456789012"
backend_bucket          = "my-terraform-backend"
backend_key             = "state/multi-account-setup.tfstate"
backend_region          = "us-east-1"
backend_dynamodb_table  = "terraform-locks"
```

---

### IAM Module Files

#### `# FILE: modules/iam/main.tf`
```hcl