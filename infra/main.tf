module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  us_availability_zone = var.us_availability_zone
  cidr_private_subnet  = var.cidr_private_subnet
}

module "security_group" {
  source      = "./security-groups"
  ec2_sg_name = "SG for EC2 to enable SSH(22) and HTTP(80)"
  vpc_id      = module.networking.vpc_1_id
}

