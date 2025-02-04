resource "aws_organizations_organizational_unit" "example" {
  name      = "ExampleOU"
  parent_id = data.aws_organizations_organization.example.roots[0].id
}

data "aws_organizations_organization" "example" {}
```

---

#### `modules/control_tower/variables.tf`
```hcl