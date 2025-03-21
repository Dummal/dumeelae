variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created."
  type        = string
}

variable "cidr_block" {
  description = "The base CIDR block for the subnets."
  type        = string
}

variable "ipv6_enabled" {
  description = "Whether to enable IPv6 for the subnets."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block if IPv6 is enabled."
  type        = string
  default     = null
}

variable "subnet_config" {
  description = "Map of subnet configurations. Each key represents a subnet and values include type, CIDR, AZ, etc."
  type = map(object({
    type           = string
    cidr_block     = string
    az             = string
    ipv6_cidr_block = string
    name           = string
  }))
}

variable "public_subnet_key" {
  description = "Key of one of the public subnets to be used for NAT Gateway."
  type        = string
}

variable "network_acl_id" {
  description = "Network ACL ID to associate with the subnets."
  type        = string
  default     = null
}

variable "network_acl_rules" {
  description = "List of network ACL rules."
  type = list(object({
    rule_number    = number
    protocol       = string
    rule_action    = string
    egress         = bool
    cidr_block     = string
    ipv6_cidr_block = string
    from_port      = number
    to_port        = number
  }))
  default = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default     = {}
}