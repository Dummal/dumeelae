variable "management_account_id" {
description = "AWS Management Account ID"
type        = string
}

variable "member_accounts" {
description = "List of AWS member accounts"
type        = list(string)
}
```

---

#### `# FILE: modules/control_tower/outputs.tf`
```hcl