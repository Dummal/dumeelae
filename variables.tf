```hcl
// variables.tf

// Variable for the name of the organization
variable "organization_name" {
  description = "The name of the AWS organization to be created or managed."
  type        = string
}

// Variable for the parent ID where the organization unit will be created
variable "parent_id" {
  description = "The ID of the parent organizational unit or root under which the new organizational unit will be created."
  type        = string
}

// Variable for the list of user email addresses
variable "users_email" {
  description = "A list of email addresses for the users to be added to the organization."
  type        = list(string)
}

// Variable for the AWS region
variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1"
}

// Variable for the account alias
variable "account_alias" {
  description = "The alias to assign to the AWS account."
  type        = string
}

// Variable for the IAM role name
variable "iam_role_name" {
  description = "The name of the IAM role to be created or managed."
  type        = string
}

// Variable for the policy ARN to attach to the IAM role
variable "policy_arn" {
  description = "The ARN of the policy to attach to the IAM role."
  type        = string
}

// Variable for the tags to apply to resources
variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
  default     = {}
}
```