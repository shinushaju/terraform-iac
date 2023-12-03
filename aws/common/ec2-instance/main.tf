data "aws_ami" "amazon_linux_2_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "tls_private_key" "tls_private_key" {
  count       = var.public_key == null ? 1 : 0
  algorithm   = var.tls_private_key_algorithm
  ecdsa_curve = var.tls_private_key_algorithm == "ECDSA" ? var.tls_private_key_ecdsa_curve : null
  rsa_bits    = var.tls_private_key_algorithm == "RSA" ? var.tls_private_key_rsa_bits : null
}

resource "aws_key_pair" "key_pair" {
  public_key = var.public_key == null ? tls_private_key.tls_private_key.public_key_openssh : var.public_key
}

resource "aws_instance" "instance" {
  ami           = var.ami != null ? var.ami : aws_ami.amazon_linux_2_ami
  instance_type = var.instance_type
  hibernation   = var.hibernation

  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = var.private_ip

  key_name             = var.key_name != null ? var.key_name : aws_key_pair.key_pair.key_name
  iam_instance_profile = var.iam_instance_profile
  monitoring           = var.monitoring

  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change

  dynamic "cpu_options" {
    for_each = length(var.cpu_options) > 0 ? [var.cpu_options] : []

    content {
      core_count       = try(cpu_options.value.core_count, null)
      threads_per_core = try(cpu_options.value.threads_per_core, null)
      amd_sev_snp      = try(cpu_options.value.amd_sev_snp, null)
    }
  }

  ebs_optimized = var.ebs_optimized

  disable_api_stop        = var.disable_api_stop
  disable_api_termination = var.disable_api_termination

  tags = merge({ Name = var.instance_name })
}