terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"        # (Optional) DynamoDB table for state locking
    encrypt        = true                          # Enable state file encryption
  }
}


provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["/Users/janvandenhouten/.aws/credentials"]
}