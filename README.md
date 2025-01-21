# SimpleTerraformAWSProj

This Terraform project provisions an AWS infrastructure to support a Flask API connected to a MySQL database. The deployed infrastructure includes resources for domain management, compute, storage, and networking, enabling seamless integration with the PythonFlaskApi.

## Table of Contents
- [Purpose](#purpose)
- [Requirements](#requirements)
- [Configuration](#configuration)
- [Usage](#usage)
- [Outputs](#outputs)
- [CI/CD Integration](#cicd-integration)

## Purpose
This project sets up an AWS environment with the following:
- Access to an EC2 instance hosting the PythonFlaskApi via the domain [`https://vandenhouten.com`](https://vandenhouten.com).
- Domain configuration using Route 53, Hosted Zone, AWS Certificate Manager, Load Balancer, Load Balancer Target Groups, VPC, Subnets, Internet Gateway, Security Groups, and Route Table resources.
- An RDS MySQL database deployed in a private subnet of the VPC, used by the PythonFlaskApi for data storage.
- An S3 bucket to store Terraform state, enabling resource tracking and state management.

## Requirements
- Terraform CLI
- An AWS account with access to:
    - Route 53
    - EC2
    - RDS
    - S3
    - Certificate Manager
    - Load Balancer
    - VPC

## Configuration
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Skyphoenixx/SimpleTerraformAWSProj.git
   cd SimpleTerraformAWSProj
   ```

2. **Set AWS Credentials:**
    - Save your `aws_access_key_id`, `aws_secret_access_key`, and `aws_session_token` (optional) in a file on your local machine.
    - Update the path to this file in the `provider.tf` file by modifying the `shared_credentials_file` variable.

3. **Deploy or Destroy the Infrastructure:**
   Navigate to the `infra` directory:
   ```bash
   cd infra
   ```
    - To deploy:
      ```bash
      terraform init
      terraform plan
      terraform apply --auto-approve
      ```
    - To destroy:
      ```bash
      terraform destroy --auto-approve
      ```

4. **Database Access:**
    - The database endpoint can be retrieved from the AWS console.
    - Default credentials:
        - **Username:** `dbuser`
        - **Password:** `dbpassword`
    - **Important:** Update the credentials to use a secure password stored in AWS Secrets Manager for production environments if used for other purposes.

## Usage
- Once deployed, you can access the Flask API at [`https://vandenhouten.com`](https://vandenhouten.com).
- Use the API to create tables and insert data into the RDS MySQL database via its web UI.

## Outputs
- Check the AWS Console for deployed resources.
- Verify that the domain [`https://vandenhouten.com`](https://vandenhouten.com) is accessible and serves the Flask API.

## CI/CD Integration
This project integrates with a CI/CD pipeline using GitHub Actions. The pipeline:
- Triggers on pushes or pull requests to the `main` branch.
- Activates the CI/CD pipeline of the central repository [`TerraformAWSFlask`](https://github.com/Skyphoenixx/TerraformAWSFlask), which:
    - Applies the Terraform infrastructure.
    - Tests the Python project in [`PythonFlaskApi`](https://github.com/Skyphoenixx/PythonFlaskApi).
    - Conducts code quality analysis with SonarCloud.