region                  = "us-east-1"
backend_bucket          = "my-terraform-backend"
backend_key             = "multi-account-setup/terraform.tfstate"
backend_region          = "us-east-1"
backend_dynamodb_table  = "terraform-lock-table"
```

---

### IAM Module Files

#### `# FILE: modules/iam/main.tf`
```hcl