resource "aws_organizations_organizational_unit" "control_tower_ou" {
  name      = var.organization_unit
  parent_id = data.aws_organizations_organization.root_id
}

data "aws_organizations_organization" "organization" {}

data "aws_organizations_organizational_units" "root_ou" {
  parent_id = data.aws_organizations_organization.root_id
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl