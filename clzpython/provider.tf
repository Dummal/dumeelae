provider "aws" {
  alias  = "management"
  region = var.management_account_region
  profile = var.management_account_profile
}

provider "aws" {
  alias  = "member"
  region = var.member_account_region
  profile = var.member_account_profile
}
```

---

#### `# FILE: terraform.tfvars`
```hcl