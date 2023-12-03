output "id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.instance.id
}

output "arn" {
  description = "The ARN of the EC2 instance."
  value       = aws_instance.instance.arn
}

output "instance_state" {
  description = "The state of the EC2 instance."
  value       = aws_instance.instance.instance_state
}

output "key_name" {
  description = "The AWS key pair that was used to create the EC2 instance."
  value       = aws_instance.instance.key_name
}

output "ami" {
  description = "The AMI ID that was used to create the EC2 instance."
  value       = aws_instance.instance.ami
}

output "availability_zone" {
  description = "The availability zone of the created EC2 instance"
  value       = aws_instance.instance.availability_zone
}

output "primary_network_interface_id" {
  description = "The primary network interface ID of the EC2 instance."
  value       = aws_instance.instance.primary_network_interface_id
}

output "private_dns" {
  description = "The private DNS name assigned to the EC2 instance."
  value       = aws_instance.instance.private_dns
}

output "public_dns" {
  description = "The public DNS name assigned to the instance."
  value       = aws_instance.instance.public_dns
}

output "public_ip" {
  description = "The public IP address assigned to the EC2 instance."
  value       = aws_instance.instance.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the EC2 instance."
  value       = aws_instance.instance.private_ip
}