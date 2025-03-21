variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created."
  type        = string
}

variable "subnet_configs" {
  description = "Configuration for subnets including CIDR blocks, types, and availability zones."
  type = list(object({
    cidr_block        = string
    type              = string
    availability_zone = string
  }))
}

variable "create_public_subnets" {
  description = "Whether to create public subnets."
  type        = bool
  default     = false
}

variable "create_private_subnets" {
  description = "Whether to create private subnets."
  type        = bool
  default     = false
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway for public subnets."
  type        = string
}

variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway for private subnets."
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "acl_rules" {
  description = "Rules for the Network ACL."
  type = list(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    egress      = bool
  }))
}