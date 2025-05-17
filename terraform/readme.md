# 🌩️ Terraform AWS EC2 Web Server Auto Deployment Project 
  
## 📌 Project Overview 
This project utilizes Terraform to define and manage AWS infrastructure as code. It provisions core networking components (VPC, Subnet, Internet Gateway, Route Table, Security Group) and deploys an EC2 instance in a public subnet that automatically installs and runs an Nginx web server via user_data.

## ✅ Technologies & Tools Used
Infrastructure as Code (IaC): Terraform

Cloud Platform: AWS (Region: us-east-2)

Operating System: Ubuntu 20.04 (EC2 AMI)

Environment: WSL2 (Ubuntu on Windows)

Utilities: AWS CLI, SSH

## 🏗️ Infrastructure Diagram (Simplified)
scss
Copy
Edit
AWS Cloud
└── VPC (10.0.0.0/16)
    └── Public Subnet (10.0.1.0/24)
        └── EC2 Instance (Ubuntu)
            └── Nginx Web Server
## ⚙️ Key Terraform Resources
aws_vpc: Creates a VPC with CIDR 10.0.0.0/16

aws_subnet: Creates two public subnets

aws_internet_gateway: Attaches IGW to the VPC for internet access

aws_route_table + aws_route_table_association: Configures internet route (0.0.0.0/0 → IGW)

aws_security_group: Allows inbound SSH (port 22) and HTTP (port 80)

aws_instance: Launches EC2 instance with Nginx auto-installed via user_data

## 🔧 user_data Script (Executed on EC2 Boot)
bash
Copy
Edit
#!/bin/bash
apt update -y
apt install -y nginx
echo "<h1>Hello from Terraform EC2 with user_data!</h1>" > /var/www/html/index.html
systemctl enable nginx
systemctl start nginx

## 🧪 Testing & Results
Successfully executed terraform apply to provision infrastructure

Nginx web server was automatically installed and started

Web page was accessible via EC2's public IP in a browser

Verified Nginx response internally with curl localhost over SSH

##👤 Author
Name: Jiyoung Lee
GitHub: https://github.com/your-username
