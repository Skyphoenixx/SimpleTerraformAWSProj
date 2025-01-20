terraform {
  backend "s3" {
    bucket = "remote-state-bucket-1"
    key    = "simple-terraform-aws-proj/terraform.tfstate"
    region = "us-east-1"
  }
}