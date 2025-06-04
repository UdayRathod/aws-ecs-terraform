# aws-ecs-terraform
Repo for hosting your resume in a docker container in AWS via ECS cluster containers deployed via terraform

# Services Configured
The Terraform configurations in this repository allow you to deploy the following AWS services:
VPC (including route table and subnets)
ECS Cluster
ECS Taks Defination
ECS Service
Load Balancer
Security groups

# Getting Started
To get started with deploying the AWS services using Terraform, follow these steps:

1) Clone this repository to your local machine.

2) Install Terraform (version X.X.X) from the official Terraform website here.

3) Configure your AWS credentials by setting the necessary environment variables or using the AWS CLI aws configure command:

# For Linux and MacOS
    #export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
    #export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY

    # For PowerShell
    #$env:AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
    #$env:AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"


4) Navigate to the desired service directory within the repository.

5) Run terraform init to initialize the Terraform workspace.

6) Run terraform plan to review the planned infrastructure changes.

7) Run terraform apply to apply the Terraform configurations and provision the AWS resources.
