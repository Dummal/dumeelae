variable "vpc_id" {
  description = "ID of the VPC where subnets will be created"
  type        = string
}

variable "cidr_block" {
  description = "Base CIDR block for subnet allocation"
  type        = string
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for subnets"
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block for subnets"
  type        = string
  default     = null
}

variable "type" {
  description = "Type of subnets: public or private"
  type        = string
}

variable "azs" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "network_acl_id" {
  description = "Network ACL ID to associate with subnets"
  type        = string
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "network_acl_rules" {
  description = "List of network ACL rules"
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