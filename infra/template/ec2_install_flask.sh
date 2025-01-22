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

# Set environment variables for Flask app
cat <<EOF | sudo tee -a /etc/environment
DB_HOST=${rds_endpoint}
DB_USER=${rds_username}
DB_PASSWORD=${rds_password}
DB_NAME=${rds_dbname}
EOF

# Export variables for the current session
export DB_HOST=${rds_endpoint}
export DB_USER=${rds_username}
export DB_PASSWORD=${rds_password}
export DB_NAME=${rds_dbname}

source /etc/environment

# Install dependencies from requirements.txt
pip3 install -r requirements.txt

# Wait for a short duration before running the application
sleep 10
echo 'Waiting for 30 seconds before running app.py'

# Run the application
cd app_package
python3 -u application.py > /var/log/flask_app.log 2>&1 &
sleep 30