output "iam_role_arn" {
description = "IAM Role ARN"
value       = module.iam.role_arn
}

output "aws_resources" {
description = "AWS Resources Outputs"
value       = module.aws_resources
}

output "control_tower" {
description = "Control Tower Outputs"
value       = module.control_tower
}
```

---

#### `# FILE: provider.tf`
```hcl