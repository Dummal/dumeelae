variable "vpc_id" {
  description = "ID of the VPC where subnets will be created"
  type        = string
}

variable "cidr_block" {
  description = "Base CIDR block for subnets"
  type        = string
}

variable "ipv6_enabled" {
  description = "Enable IPv6 addressing for subnets"
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block for subnets"
  type        = string
  default     = null
}

variable "type" {
  description = "Type of subnets to create (public or private)"
  type        = string
}

variable "azs" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "subnet_size" {
  description = "Subnet size (CIDR prefix length)"
  type        = number
}

variable "nat_enabled" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = false
}

variable "network_acl_id" {
  description = "ID of the Network ACL to associate with subnets"
  type        = string
  default     = null
}

variable "network_acl_rules" {
  description = "List of network ACL rules to apply"
  type        = list(object({
    rule_number    = number
    protocol       = string
    action         = string
    cidr_block     = string
    ipv6_cidr_block = string
    egress         = bool
  }))
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}