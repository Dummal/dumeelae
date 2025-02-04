output "iam_role_arn" {
  value       = module.iam.role_arn
  description = "IAM Role ARN"
}

output "vpc_id" {
  value       = module.aws_resources.vpc_id
  description = "VPC ID"
}

output "control_tower_account_ids" {
  value       = module.control_tower.account_ids
  description = "Control Tower Account IDs"
}
```

---

#### `# FILE: provider.tf`
```hcl