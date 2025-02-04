resource "aws_organizations_organizational_unit" "ou" {
  name      = var.organization_unit
  parent_id = data.aws_organizations_organization.root_id
}

data "aws_organizations_organization" "org" {}

data "aws_organizations_organization" "root_id" {
  id = data.aws_organizations_organization.org.roots[0].id
}

output "status" {
  value = "Control Tower setup completed for OU: ${aws_organizations_organizational_unit.ou.name}"
}
```

---

#### `modules/control_tower/variables.tf`
```hcl