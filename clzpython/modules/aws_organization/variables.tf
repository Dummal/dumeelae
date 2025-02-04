variable "organization_name" {
  description = "Name of the AWS Organization"
  type        = string
  default     = "MyOrganization"
}

variable "dev_account_email" {
  description = "Email for the development account"
  type        = string
  default     = "dev@example.com"
}

variable "prod_account_email" {
  description = "Email for the production account"
  type        = string
  default     = "prod@example.com"
}
```

---

### File 5: `modules/aws_organization/outputs.tf`
```hcl