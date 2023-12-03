# Amazon VPC outputs
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

# Amazon EC2 instance outputs
output "ec2_instance_id" {
  description = "The ID of the EC2 instance."
  value       = module.ec2-instance.id
}

output "ec2_instance_arn" {
  description = "The ARN of the EC2 instance."
  value       = module.ec2-instance.arn
}

output "ec2_instance_state" {
  description = "The state of the EC2 instance."
  value       = module.ec2-instance.instance_state
}

output "ec2_instance_key_name" {
  description = "The AWS key pair that was used to create the EC2 instance."
  value       = module.ec2-instance.key_name
}

output "ec2_instance_ami" {
  description = "The AMI ID that was used to create the EC2 instance."
  value       = module.ec2-instance.ami
}

output "ec2_instance_availability_zone" {
  description = "The availability zone of the created EC2 instance"
  value       = module.ec2-instance.availability_zone
}

output "ec2_instance_public_ip" {
  description = "The public IP address assigned to the EC2 instance."
  value       = module.ec2-instance.public_ip
}

output "ec2_instance_private_ip" {
  description = "The private IP address assigned to the EC2 instance."
  value       = module.ec2-instance.private_ip
}