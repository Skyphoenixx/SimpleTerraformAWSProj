variable "vpc_name" {
  type        = string
  description = "SimpleTerraformAWSProj VPC 1"
}

variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "us_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}