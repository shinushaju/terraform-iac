output "aws_availability_zones" {
  description = "List of all AWS Availability Zones which can be accessed within the region."
  value       = data.aws_availability_zones.available
}

output "vpc_arn" {
  description = "The Amazon Resource Name (ARN) of VPC."
  value       = aws_vpc.vpc.arn
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  value       = aws_vpc.vpc.cidr_block
}

output "main_route_table_id" {
  description = "The ID of the main route table associated with this VPC."
  value       = aws_vpc.vpc.main_route_table_id
}

output "default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation."
  value       = aws_vpc.vpc.default_network_acl_id
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation."
  value       = aws_vpc.vpc.default_security_group_id
}

output "default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation."
  value       = aws_vpc.vpc.default_route_table_id
}

output "owner_id" {
  description = "The ID of the AWS account that owns the VPC."
  value       = aws_vpc.vpc.owner_id
}

output "private_subnets_ids" {
  description = "The IDs of Amazon VPC private subnets."
  value       = aws_subnet.private_subnets.*.id
}

output "private_subnets_arns" {
  description = "The ARNs of Amazon VPC private subnets."
  value       = aws_subnet.private_subnets.*.arn
}

output "public_subnets_ids" {
  description = "The IDs of Amazon VPC public subnets."
  value       = aws_subnet.public_subnets.*.id
}

output "public_subnets_arns" {
  description = "The ARNs of Amazon VPC public subnets."
  value       = aws_subnet.public_subnets.*.arn
}

output "internet_gateway_id" {
  description = "Amazon VPC Internet Gateway ID."
  value       = aws_internet_gateway.internet_gateway[0].id
}

output "eips_private_dns" {
  description = "Private IP of Elastic IPs."
  value       = aws_eip.eips.*.private_ip
}

output "eips_private_ips" {
  description = "Private DNS of Elastic IPs."
  value       = aws_eip.eips.*.private_dns
}

output "eips_public_dns" {
  description = "Public DNS of Elastic IPs."
  value       = aws_eip.eips.*.public_dns
}

output "eips_public_ips" {
  description = "Public DNS of Elastic IPs."
  value       = aws_eip.eips.*.public_ip
}

output "nat_gateways_ids" {
  description = "IDs of Amazon VPC NAT Gateways."
  value       = aws_nat_gateway.nat_gateways.*.id
}