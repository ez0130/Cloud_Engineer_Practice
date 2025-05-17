variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  description = "Ubuntu 20.04 AMI for us-east-2"
  default     = "ami-0fb653ca2d3203ac1" # 2025 기준 Ubuntu 20.04 for us-east-2
}

variable "key_name" {
  description = "Name of EC2 key pair"
  default     = "terraform-linux-key" 
}
