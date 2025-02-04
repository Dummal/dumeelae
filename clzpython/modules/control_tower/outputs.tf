output "organization_id" {
value = aws_organizations_organization.example.id
}

output "account_id" {
value = aws_organizations_account.example.id
}
```

---

This configuration sets up a multi-account AWS environment using Terraform. It includes modules for IAM, AWS resources, and Control Tower, and is structured to allow for easy customization and scalability.