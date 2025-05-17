# 3-Tier Infrastructure with Terraform on AWS

This project sets up a basic 3-tier architecture using Terraform. It includes:

- A custom VPC
- Two public subnets
- An Internet Gateway
- Route tables and associations
- A security group allowing SSH and HTTP
- A single EC2 instance with Ubuntu 20.04

## Tools Used

- Terraform
- AWS
- NGINX

##  Structure

```bash
.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf (optional)
└── .gitignore
