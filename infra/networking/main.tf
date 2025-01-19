variable "vpc_cidr" {}
variable "vpc_name" {}

resource "aws_vpc" "dev_proj_1_vpc_us_east_1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}