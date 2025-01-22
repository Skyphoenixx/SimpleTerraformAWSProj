variable "bucket_name" {
  type        = string
  description = "Remote state bucket name"
}

variable "name" {
  type        = string
  description = "Tag name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

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

variable "public_key" {
  type        = string
  description = "Public key for EC2 instance"
}

variable "ec2_ami_id" {
  type        = string
  description = "AMI Id for EC2 Amazon Linux instance"
}

variable "domain_name" {
  type = string
  description = "Name of the domain"
}

variable "mysql_username" {
    type = string
    description = "Username for the RDS MySQL database"
}

variable "mysql_password" {
    type = string
    description = "Password for the RDS MySQL database"
}

variable "mysql_dbname" {
    type = string
    description = "Name of the RDS MySQL database"
}