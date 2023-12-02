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