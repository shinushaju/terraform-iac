# Amazon VPC
module "vpc" {
  source = "../aws/common/vpc"

  vpc_name             = var.vpc_name
  cidr_block           = var.vpc_cidr_block
  availability_zones   = var.availability_zones
  num_private_subnets  = var.vpc_num_private_subnets
  private_subnet_cidrs = var.vpc_private_subnet_cidrs
  num_public_subnets   = var.vpc_num_public_subnets
  public_subnet_cidrs  = var.vpc_public_subnet_cidrs
}

# Amazon EC2 Instance(s)
module "ec2-instance" {
  source = "../aws/common/ec2-instance"
  count  = var.ec2_instance_enabled ? var.ec2_instance_count : 0

  instance_name          = "${var.ec2_instance_name}-${count.index}"
  ami                    = var.ec2_instance_ami
  instance_type          = var.ec2_instance_type
  subnet_id              = module.vpc.private_subnets_ids[count.index].id
  vpc_security_group_ids = module.vpc.default_security_group_id
  private_ip             = module.vpc.eips_private_ips[count.index].id
}