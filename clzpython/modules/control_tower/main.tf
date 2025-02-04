resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

output "status" {
  value = "Control Tower setup complete"
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl