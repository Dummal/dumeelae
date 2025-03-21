variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created."
  type        = string
}

variable "cidr_blocks" {
  description = "CIDR blocks for the subnets."
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones for the subnets."
  type        = list(string)
}

variable "type" {
  description = "Type of subnets to create (public or private)."
  type        = string
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for the subnets."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block for the subnets."
  type        = string
  default     = null
}

variable "nat_enabled" {
  description = "Enable NAT Gateway for private subnets."
  type        = bool
  default     = false
}

variable "network_acl_id" {
  description = "Network ACL ID to associate with subnets."
  type        = string
  default     = null
}

variable "network_acl_rules" {
  description = "Rules for the Network ACL."
  type        = list(object({
    rule_number = number
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}