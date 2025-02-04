output "account_ids" {
  description = "The list of account IDs created"
  value       = [aws_organizations_account.example.id]
}
```

---

This configuration provides a basic structure for a multi-account AWS setup using Terraform. You can expand and customize it further based on your specific requirements.