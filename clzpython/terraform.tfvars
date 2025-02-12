aws_region         = "us-east-1"
account_ids        = ["123456789012", "987654321098"]
organization_unit  = "Engineering"
iam_roles          = ["Admin", "Developer", "ReadOnly"]
resource_tags      = {
  Environment = "Production"
  Team        = "DevOps"
}
```

---

### IAM Module Files

#### `# FILE: modules/iam/main.tf`
```hcl