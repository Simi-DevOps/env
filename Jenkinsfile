resource "aws_instance" "ec2_1" {

  ami           = ami-00b1c9efd33fda707
  instance_type = t2.medium
  key_name      = Thirdkey
  availability_zone = "eu-west-1a"
  tags              = EC2 1 machine
}

resource "aws_instance" "ec2_2" {

  ami           = ami-00b1c9efd33fda707
  instance_type = t2.medium
  key_name      = Thirdkey
  availability_zone = "eu-west-1b"
  tags              =  EC2 2 machine
}


resource "aws_vpc" "Task5_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Task 5 VPC"
  }
}

resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.Task5_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.Task5_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public Subnet 2"
  }
}

output "aws_vpc" {
  value = aws_vpc.Task5_vpc.id
}

output "subnet" {
  value = aws_subnet.pub1.id
}

output "subnet" {
  value = aws_subnet.pub2.id
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Task5_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }


}
backend.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "simidevops-terraform-state-files"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}