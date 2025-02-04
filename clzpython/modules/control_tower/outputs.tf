output "organization_id" {
  value = aws_organizations_organization.org.id
}

output "shared_services_account_id" {
  value = aws_organizations_account.shared_services_account.id
}

output "workload_account_id" {
  value = aws_organizations_account.workload_account.id
}
```

---

This configuration sets up a multi-account AWS environment with a management account, shared services account, and workload account. It uses modules for IAM, AWS resources, and Control Tower to organize the infrastructure. You can expand these modules further based on your specific requirements.