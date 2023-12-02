variable "vpc_name" {
  description = "(Optional) Amazon VPC name."
  type        = string
  default     = null
}

variable "vpc_cidr_block" {
  description = "(Optional) The IPv4 CIDR block for the VPC."
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "(Optional) List of AWS Availability Zones which can be accessed within the region."
  type        = list(string)
  default     = []
}

variable "vpc_num_private_subnets" {
  description = "(Required) Number of Amazon VPC private subnets."
  type        = number
  default     = 3
}

variable "vpc_private_subnet_cidrs" {
  type        = list(string)
  description = "(Optional) List of Amazon VPC private subnet CIDR values."
  default     = []
}

variable "vpc_num_public_subnets" {
  description = "(Required) Number of Amazon VPC public subnets."
  type        = number
  default     = 3
}

variable "vpc_public_subnet_cidrs" {
  type        = list(string)
  description = "(Optional) List of Amazon VPC public subnet CIDR values."
  default     = []
}