resource "aws_organizations_organizational_unit" "ou" {
  name      = var.organization_unit
  parent_id = data.aws_organizations_organization.root_id
}

data "aws_organizations_organization" "organization" {}

output "ou_id" {
  value = aws_organizations_organizational_unit.ou.id
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl