variable "public_key" {
  description = "(Optional) Public key material for Key Pair."
  type        = string
  default     = null
}

variable "tls_private_key_algorithm" {
  description = "(Optional) Name of the algorithm to use when generating the private key. Currently-supported values are: RSA, ECDSA, ED25519."
  type        = string
  default     = "RSA"
}

variable "tls_private_key_ecdsa_curve" {
  description = "(Optional) When algorithm is ECDSA, the name of the elliptic curve to use. Currently-supported values are: P224, P256, P384, P521."
  type        = string
  default     = "P224"
}

variable "tls_private_key_rsa_bits" {
  description = "(Optional) When algorithm is RSA, the size of the generated RSA key, in bits."
  type        = number
  default     = 2048
}

variable "key_name" {
  description = "(Optional) The name for the key pair."
  type        = string
  default     = null
}

variable "instance_name" {
  description = "(Optional) Name for the instance."
  type        = string
  default     = null
}

variable "ami" {
  description = "(Optional) AMI to use for the instance."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "(Optional) Instance type to use for the instance."
  type        = string
  default     = "t3.micro"
}

variable "hibernation" {
  description = "(Optional) If true, the launched instance will support hibernation."
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "(Optional) Availability zone to start the instance in."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "(Optional) The VPC Subnet ID to launch in."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "(Optional) A list of security group IDs to associate with."
  type        = list(string)
  default     = null
}

variable "associate_public_ip_address" {
  description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = false
}

variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC."
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "(Optional) IAM Instance Profile to launch the instance with."
  type        = string
  default     = null
}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled."
  type        = bool
  default     = false
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "(Optional) When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true."
  type        = bool
  default     = false
}

variable "cpu_options" {
  description = "(Optional) The CPU options for the instance."
  type        = any
  default     = {}
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized."
  type        = bool
  default     = true
}

variable "disable_api_stop" {
  description = "(Optional) If true, enables EC2 Instance Stop Protection."
  type        = bool
  default     = true
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection."
  type        = bool
  default     = true
}