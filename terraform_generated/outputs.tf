output "iam_outputs" {
  description = "Outputs from the IAM module"
  value       = module.iam
}

output "aws_resources_outputs" {
  description = "Outputs from the AWS Resources module"
  value       = module.aws_resources
}

output "control_tower_outputs" {
  description = "Outputs from the Control Tower module"
  value       = module.control_tower
}
```

---

#### `# FILE: provider.tf`
```hcl