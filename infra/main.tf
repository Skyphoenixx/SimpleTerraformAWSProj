/*module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
  name        = var.name
  environment = var.environment
}*/

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
  ec2_sg_name_for_python_api = "SG for EC2 for enabling port 5000"
  public_subnet_cidr_block   = tolist(module.networking.public_subnet_cidr_block)
}

module "rds_db_instance" {
  source               = "./rds"
  db_subnet_group_name = "rds_subnet_group"
  subnet_groups        = tolist(module.networking.public_subnets_1)
  rds_mysql_sg_id      = module.security_group.rds_mysql_sg_id
  mysql_db_identifier  = "mydb"
  mysql_username       = var.mysql_username
  mysql_password       = var.mysql_password
  mysql_dbname         = var.mysql_dbname
}

module "ec2" {
  source                   = "./ec2"
  ami_id                   = var.ec2_ami_id
  instance_type            = "t2.micro"
  tag_name                 = "Amazon Linux"
  public_key               = var.public_key
  subnet_id                = tolist(module.networking.public_subnets_1)[0]
  sg_enable_ssh_https      = module.security_group.sg_ec2_sg_ssh_http_id
  ec2_sg_name_for_python_api     = module.security_group.sg_ec2_for_python_api
  enable_public_ip_address = true
  user_data_install_apache = templatefile("${path.module}/template/ec2_install_flask.sh", {
    rds_endpoint = module.rds_db_instance.rds_endpoint
    rds_username = var.mysql_username
    rds_password = var.mysql_password
    rds_dbname   = var.mysql_dbname
  })
}

module "lb_target_group" {
  source                   = "./load-balancer-target-group"
  lb_target_group_name     = "lb-target-group-1"
  lb_target_group_port     = 5000
  lb_target_group_protocol = "HTTP"
  vpc_id                   = module.networking.vpc_1_id
  ec2_instance_id          = module.ec2.ec2_instance_id
}

module "alb" {
  source                    = "./load-balancer"
  lb_name                   = "a-load-balancer"
  is_external               = false
  lb_type                   = "application"
  sg_enable_ssh_https       = module.security_group.sg_ec2_sg_ssh_http_id
  sg_enable_http            = module.security_group.sg_ec2_for_python_api
  subnet_ids                = tolist(module.networking.public_subnets_1)
  lb_target_group_arn       = module.lb_target_group.lb_target_group_arn
  ec2_instance_id           = module.ec2.ec2_instance_id
  lb_listner_port           = 5000
  lb_listner_protocol       = "HTTP"
  lb_listner_default_action = "forward"
  lb_https_listner_port     = 443
  lb_https_listner_protocol = "HTTPS"
  dev_proj_1_acm_arn        = module.aws_certification_manager.acm_arn
  lb_target_group_attachment_port = 5000
}

module "hosted_zone" {
  source          = "./hosted-zone"
  domain_name     = var.domain_name
  aws_lb_dns_name = module.alb.aws_lb_dns_name
  aws_lb_zone_id  = module.alb.aws_lb_zone_id
}

module "aws_certification_manager" {
  source         = "./certificate-manager"
  domain_name    = var.domain_name
  hosted_zone_id = module.hosted_zone.hosted_zone_id
}