```hcl
variable "organization_name" {
  type        = string
  description = "The name of the AWS organization."
}

variable "parent_id" {
  type        = string
  description = "The parent ID for the organizational units."
}

variable "users_email" {
  type        = list(string)
  description = "A list of email addresses for users in the organization."
}
```

---