output "aws_availability_zones" {
  description = "List of all AWS Availability Zones which can be accessed within the region."
  value       = module.vpc.aws_availability_zones
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.id
}