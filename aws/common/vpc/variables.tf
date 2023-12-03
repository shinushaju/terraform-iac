variable "vpc_name" {
  description = "(Optional) Amazon VPC name."
  type        = string
  default     = null
}

variable "cidr_block" {
  description = "(Optional) The IPv4 CIDR block for the VPC."
  type        = string
  default     = null
}

variable "instance_tenancy" {
  description = "(Optional) A tenancy option for instances launched into the VPC. Valid values: [default, dedicated]."
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_network_address_usage_metrics" {
  description = "(Optional) Indicates whether Network Address Usage metrics are enabled for your VPC."
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "(Optional) List of AWS Availability Zones which can be accessed within the region."
  type        = list(string)
  default     = []
}

variable "num_private_subnets" {
  description = "(Required) Number of Amazon VPC private subnets."
  type        = number
}

variable "private_subnet_cidrs" {
  description = "(Optional) List of Amazon VPC private subnet CIDR values."
  type        = list(string)
  default     = []
}

variable "num_public_subnets" {
  description = "(Required) Number of Amazon VPC public subnets."
  type        = number
}

variable "public_subnet_cidrs" {
  description = "(Optional) List of Amazon VPC public subnet CIDR values."
  type        = list(string)
  default     = []
}