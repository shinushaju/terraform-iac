output "aws_availability_zones" {
  description = "List of all AWS Availability Zones which can be accessed within the region."
  value       = module.vpc.aws_availability_zones
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.id
}

output "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  value       = module.vpc.vpc_cidr_block
}