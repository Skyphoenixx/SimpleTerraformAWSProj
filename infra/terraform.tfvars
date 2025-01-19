vpc_cidr             = "10.0.0.0/16"
vpc_name             = "us-east-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
us_availability_zone = ["us-east-1a", "us-east-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtG4YZQEQFu5dpmSeXvy2jHse+LXfZ5swTOC9Fp3+2ygxKpaAajZYdIkj7ZkfCxwcOpuqD5oIKZrWf81VlymRoMwRSx7GFNhuX7iWmi5TIuZ/TfaMExwqRnSL4TkZWNlf38KvA2v8xYpU+jFYNJB3eHkhXTuBQFGeH7cn3owmHSU5jkb1LcDe7RKctZkp5+TAnQxJrBkAn+wm5jJ6cr2Ytql8nrBuuHsvwI1tqxdYDb/eN663+RhVxI5pT90aVR9mjbkNeJ8YJawEtyXPZ2qU1Bq+r0wLx3yVVs87JpcdOsNPoS/Hmn5M8ELEDLOFykMr71h1lEUYdQfAUcaj3DRBarhSRE86Wg081dERs4o+GmKvGarbGqPWivMRsZpjmcLLgYeaqztm1RkuvLVIZDUdDoPILK0c3QW9qHmv18FC5GDgirJ6HuE6qKNvXDpJmNUOCj2jTHG6ojme0unOlh92j7bvh6hsHoUzBwHL3nfP7ckIF2GqsPbQjuF+cPtEf0xgZu+Gmce0x4aYMQBWiVlUv3TjM3jHzNHozG3LV/PK8H1XzkwHHDyRVJ1pNmmkDfJ4LLjbG0gpLm0Jp6qQ2Lx35LAX1HG/deZA4N8x6FnE4Az/eeEfm2czGUxqiZ3H05qVvQhGPlRLkThuJ5uVO1d1csWqzbZ6ryp/LSlqePygoLQ== janvandenhouten@Jans-MacBook-Pro.fritz.box"
ec2_ami_id     = "ami-0df8c184d5f6ae949"
ec2_user_data_install = "./template/ec2_install_flask.sh"

domain_name = "vandenhouten.com"