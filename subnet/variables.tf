variable "vpc_id" {
  description = "ID of the VPC where subnets will be created"
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of Availability Zones for subnets"
  type        = list(string)
}

variable "type" {
  description = "Type of subnets: public or private"
  type        = string
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for subnets"
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block for subnets (if enabled)"
  type        = string
  default     = null
}

variable "nat_enabled" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}

variable "network_acl_id" {
  description = "ID of an existing Network ACL (optional)"
  type        = string
  default     = ""
}

variable "acl_rules" {
  description = "List of rules for the Network ACL"
  type = list(object({
    rule_number = number
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    egress      = bool
  }))
  default = []
}