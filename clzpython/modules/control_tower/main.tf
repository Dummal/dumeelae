resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "shared_services_account" {
  name      = "SharedServicesAccount"
  email     = "shared-services@example.com"
  role_name = "OrganizationAccountAccessRole"
}

resource "aws_organizations_account" "workload_account" {
  name      = "WorkloadAccount"
  email     = "workload@example.com"
  role_name = "OrganizationAccountAccessRole"
}
```

---

#### `modules/control_tower/variables.tf`
```hcl