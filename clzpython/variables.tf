```hcl
variable "organization_name" {
  type        = string
  description = "The name of the AWS organization."
}

variable "parent_id" {
  type        = string
  description = "The ID of the parent organizational unit."
}

variable "users_email" {
  type        = list(string)
  description = "A list of email addresses for users in the organization."
}
```

---