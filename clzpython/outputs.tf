output "iam_outputs" {
  value = module.iam
}

output "aws_resources_outputs" {
  value = module.aws_resources
}

output "control_tower_outputs" {
  value = module.control_tower
}
```

---

#### `# FILE: provider.tf`
```hcl