## Overview
This project focuses on automating infrastructure management and Docker image building for the Energi Node using Terraform, Docker, and AWS. The solution is aimed at setting up the necessary infrastructure, including IAM roles, policies, and users on AWS, as well as automating the process of building and running the Energi Node in a Docker container.

Building the Docker image for the Energi Node.  
Deploying it to a Kubernetes cluster.  
Pushing the image to AWS ECR (Elastic Container Registry).  
Managing IAM roles, policies, and users in AWS using Terraform.  

## Project Components  

Terraform Scripts: Used for creating and managing IAM roles, policies, users, and groups in AWS.  
Dockerfile: Contains the configuration to build the Docker image for the Energi Node.  
Jenkinsfile: Defines the stages of the CI/CD pipeline, including code checkout, Docker build, AWS ECR login, image push, and deployment to Kubernetes.  
.gitignore: Ensures that sensitive files (like Terraform state files) are not committed to GitHub.  
README.md: Provides instructions for setting up and using the project.  


## Key Features of the DevOps Pipeline
Automated Builds: The pipeline automates the build process, ensuring that the Energi Node Docker image is built and pushed to AWS ECR every time changes are pushed to the GitHub repository.

IAM Role Management: Terraform is used to create the necessary IAM roles and policies in AWS to control access to ECR and other AWS services.

Kubernetes Deployment: The pipeline integrates with kubectl to deploy the latest Docker image to a Kubernetes cluster, ensuring that the latest version of the Energi Node is always running in production.

Environment Management: The project supports multiple environments (e.g., dev, prod) through the use of environment variables and Terraform variable configuration.

Sensitive Data Management: Sensitive information, such as AWS credentials and state files, are managed securely using .gitignore and environment variables. Terraform state files are excluded from version control to ensure security.

## Troubleshooting
AWS ECR Login Failure: If you encounter authentication issues when pushing to AWS ECR, ensure that your AWS CLI is configured correctly and that your IAM user has the necessary permissions to access ECR.

Kubernetes Deployment Failure: If the kubectl command fails during the pipeline, verify that the Kubernetes credentials are correctly set up in Jenkins and that your cluster is accessible from the Jenkins environment.

Terraform Errors: If Terraform encounters errors when applying the configuration, check the Terraform logs for more details. Common issues may include incorrect IAM permissions or misconfigured variables.


## Conclusion
This project provides a DevOps solution for managing and deploying the Energi Node using Terraform, Docker, AWS, and Kubernetes.
