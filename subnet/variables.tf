variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created."
  type        = string
}

variable "cidr_block" {
  description = "The base CIDR block for subnet allocation."
  type        = string
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for subnets."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for subnet allocation."
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "List of availability zones for subnet creation."
  type        = list(string)
}

variable "type" {
  description = "Type of subnets to create (public or private)."
  type        = string
}

variable "nat_gateway_enabled" {
  description = "Enable NAT Gateway for private subnets."
  type        = bool
  default     = false
}

variable "network_acl_id" {
  description = "Optional Network ACL ID to associate with subnets."
  type        = string
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
}