variable "organization_name" {
  description = "The name of the AWS Organization"
  type        = string
}

variable "parent_id" {
  description = "The ID of the parent organizational unit"
  type        = string
}

variable "users_email" {
  description = "A list of email addresses for IAM users"
  type        = list(string)
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
```

```hcl