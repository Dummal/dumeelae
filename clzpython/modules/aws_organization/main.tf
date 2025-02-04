resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "dev_account" {
  name      = "DevelopmentAccount"
  email     = "dev@example.com"
  role_name = "OrganizationAccountAccessRole"
}

resource "aws_organizations_account" "prod_account" {
  name      = "ProductionAccount"
  email     = "prod@example.com"
  role_name = "OrganizationAccountAccessRole"
}

resource "aws_iam_role" "cross_account_role" {
  name = "CrossAccountRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = [
            aws_organizations_account.dev_account.arn,
            aws_organizations_account.prod_account.arn
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

output "organization_id" {
  value = aws_organizations_organization.org.id
}

output "dev_account_id" {
  value = aws_organizations_account.dev_account.id
}

output "prod_account_id" {
  value = aws_organizations_account.prod_account.id
}
```

---

### File 4: `modules/aws_organization/variables.tf`
```hcl