#!/bin/bash

# Navigate to the home directory
cd /home/ec2-user || exit

# Update the system and install Python3 and pip
yes | sudo yum update -y
yes | sudo yum install -y python3 python3-pip git

# Clone the GitHub repository
git clone https://github.com/Skyphoenixx/PythonFlaskApi.git
sleep 20

# Navigate to the cloned repository directory
cd PythonFlaskApi

# Inject the RDS endpoint into the environment
export DB_HOST="${rds_endpoint}"
export DB_USER="${rds_username}"
export DB_PASSWORD="${rds_password}"
export DB_NAME="${rds_dbname}"

# Install dependencies from requirements.txt
pip3 install -r requirements.txt

# Wait for a short duration before running the application
sleep 10
echo 'Waiting for 30 seconds before running app.py'

# Run the application
cd app_package
python3 -u application.py
sleep 30