data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block                           = var.cidr_block
  instance_tenancy                     = var.instance_tenancy
  enable_dns_support                   = var.enable_dns_support
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  enable_dns_hostnames                 = var.enable_dns_hostnames

  tags = merge({ Name = var.vpc_name != null ? var.vpc_name : "terraform-vpc" })
}

resource "aws_subnet" "private_subnets" {
  count                   = var.num_private_subnets
  availability_zone       = length(var.availability_zones) > 0 ? element(var.availability_zones, count.index) : var.data.aws_availability_zones.available.names[count.index]
  cidr_block              = length(var.private_subnet_cidrs) > 0 ? element(var.private_subnet_cidrs, count.index) : cidrsubnet(var.cidr_block, var.num_private_subnets, count.index + var.num_private_subnets)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-private-subnet-${count.index}" : "terraform-vpc-private-subnet-${count.index}" })
}

resource "aws_eip" "eips" {
  count  = var.num_public_subnets > 0 ? var.num_private_subnets : 0
  domain = "vpc"

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-eip-${count.index}" : "terraform-eip-${count.index}" })
}

resource "aws_nat_gateway" "nat_gateways" {
  count         = var.num_public_subnets > 0 ? var.num_private_subnets : 0
  allocation_id = element(aws_eip.eips.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnets.*.id, count.index)

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-nat-gateway-${count.index}" : "terraform-vpc-nat-gateway-${count.index}" })

  depends_on = [
    aws_internet_gateway.internet_gateway,
  ]
}

resource "aws_route_table" "private_route_tables" {
  count  = var.num_private_subnets
  vpc_id = aws_vpc.vpc.id

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-private-route-table-${count.index}" : "terraform-vpc-private-route-table-${count.index}" })
}

resource "aws_route" "private_routes" {
  count                  = var.num_private_subnets
  route_table_id         = element(aws_route_table.private_route_tables.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gateways.*.id, count.index)
}

resource "aws_route_table_association" "private_route_table_assocations" {
  count          = var.num_private_subnets
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.private_route_tables.*.id, count.index)
}

resource "aws_subnet" "public_subnets" {
  count                   = var.num_public_subnets
  availability_zone       = length(var.availability_zones) > 0 ? element(var.availability_zones, count.index) : var.data.aws_availability_zones.available.names[count.index]
  cidr_block              = length(var.public_subnet_cidrs) > 0 ? element(var.public_subnet_cidrs, count.index) : cidrsubnet(var.cidr_block, var.num_public_subnets, count.index + var.num_public_subnets)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc.id

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-public-subnet-${count.index}" : "terraform-vpc-public-subnet-${count.index}" })
}

resource "aws_internet_gateway" "internet_gateway" {
  count  = var.num_public_subnets > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-internet-gateway-${count.index}" : "terraform-vpc-internet-gateway-${count.index}" })
}

resource "aws_route_table" "public_route_tables" {
  count  = var.num_public_subnets
  vpc_id = aws_vpc.vpc.id

  tags = merge({ Name = var.vpc_name != null ? "${var.vpc_name}-public-route-table-${count.index}" : "terraform-vpc-public-route-table-${count.index}" })
}

resource "aws_route" "public_routes" {
  count                  = var.num_public_subnets
  route_table_id         = element(aws_route_table.public_route_tables.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway[0].id
}

resource "aws_route_table_association" "public_route_table_assocations" {
  count          = var.num_public_subnets
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.public_route_tables.*.id, count.index)
}