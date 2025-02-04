output "account_id" {
  description = "The ID of the AWS account created"
  value       = aws_organizations_account.example.id
}
```

---

This configuration provides a basic structure for a multi-account AWS setup using Terraform. You can expand and customize the modules as needed to include additional resources, policies, and configurations.