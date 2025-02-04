output "iam_role_arn" {
  description = "The ARN of the IAM role created"
  value       = module.iam.role_arn
}

output "control_tower_account_ids" {
  description = "The list of account IDs created by Control Tower"
  value       = module.control_tower.account_ids
}
```

---

#### `provider.tf`
```hcl