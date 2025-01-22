# This file is used to define the outputs of the terraform module

output "ec2_instance_public_ip" {
  value = module.ec2.ec2_instance_public_ip
}

output "ec2_ssh_string" {
  value = module.ec2.ssh_connection_string_for_ec2
}

output "rds_endpoint" {
  value = module.rds_db_instance.rds_endpoint
}