output "iam_role_arns" {
  description = "List of IAM role ARNs created"
  value       = module.iam.role_arns
}

output "aws_resources" {
  description = "Details of AWS resources created"
  value       = module.aws_resources.resources
}

output "control_tower_status" {
  description = "Control Tower setup status"
  value       = module.control_tower.status
}
```

---

#### `provider.tf`
```hcl