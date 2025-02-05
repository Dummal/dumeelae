output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = module.iam.role_arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.aws_resources.vpc_id
}

output "control_tower_status" {
  description = "Control Tower setup status"
  value       = module.control_tower.status
}
```

---

#### `# FILE: provider.tf`
```hcl