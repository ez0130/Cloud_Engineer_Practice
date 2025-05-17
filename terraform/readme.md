Terraform AWS EC2 웹서버 자동 배포 프로젝트

** 프로젝트 개요

   -Terraform을 사용해 AWS 상에 기본적인 네트워크 인프라(VPC, Subnet, IGW, Route Table, Security Group)를 구성하고, 퍼블릭 서브넷 내에 EC2 인스턴스를 자동으로 생성하여 Nginx 웹서버를 설치하고 구동하는 인프라를 코드로 관리한 프로젝트입니다.

** 사용 기술 및 도구

Infrastructure as Code (IaC): Terraform

클라우드 플랫폼: AWS (us-east-2 리전)

OS: Ubuntu 20.04 (EC2 AMI)

WSL2 (Ubuntu) 환경에서 실행

AWS CLI, SSH 등 활용

***Terraform infra diagram 구축 인프라 구성도***

AWS Cloud |  VPC 10.0.0.0/16    |   Subnet- public CIDR: 10.0.1.0/24    |   EC2 Instance , Ubuntu , Nginx    

*** 주요 Terraform 리소스

aws_vpc: CIDR 10.0.0.0/16으로 VPC 생성

aws_subnet: 퍼블릭 서브넷 2개 생성

aws_internet_gateway: 인터넷 연결용 IGW 생성 및 VPC 연결

aws_route_table + aws_route_table_association: IGW를 통해 인터넷으로 라우팅 설정

aws_security_group: 22(SSH), 80(HTTP) 포트 허용

aws_instance: Ubuntu EC2 생성 + Nginx 자동 설치 (user_data)

*** user_data (EC2 부팅 시 자동 실행 스크립트)

#!/bin/bash
apt update -y
apt install -y nginx
echo "<h1>Hello from Terraform EC2 with user_data!</h1>" > /var/www/html/index.html
systemctl enable nginx
systemctl start nginx

*** 테스트 및 결과 ***

terraform apply 실행 시 EC2 자동 생성 + Nginx 설치 완료

웹브라우저에서 EC2의 퍼블릭 IP로 접속 시 웹페이지 정상 노출

SSH 접속 통해 내부에서도 curl localhost 확인 완료

*** 작성자 ***

Jiyoung Lee
GitHub: https://github.com/ez0130
