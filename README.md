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

# Dockerfile directory holds the Dockerfile, index.html & resume, to use your Resume follow below steps
Modify the below files to host your resume on ECS container. 
1) Place your resume file
2) Update the COPY command in Dockerfile with your resume file name: COPY "your-resume-file-name" /usr/share/nginx/html/resume.pdf

# Create the Docker image
docker build -t resume-hosting-app:latest .

# Tag & push to DockerHub
docker tag resume-hosting-app:latest "your-dockerhub-username"/"repo-name":"tag"


# Getting Started with Terraform
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

5) Update your image name in the "container_definitions" in "aws_ecs_task_definition"

6) Run terraform init to initialize the Terraform workspace.

7) Run terraform plan to review the planned infrastructure changes.

8) Run terraform apply to apply the Terraform configurations and provision the AWS resources.


# Contributing
Contributions are welcome!
To contribute, please fork the repository, create a new branch for your feature or bugfix, and submit a pull request.
For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

# License
This project is licensed under the MIT License.