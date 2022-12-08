terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.default_region
}

#resource "<provider>_<resource_name>" "local_name"{
 #  argument1 = value1
 #  argument2 = value2
#

resource "aws_default_security_group" "default_sec_group" {  
  vpc_id = var.defaut_vpc
  ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp" 
   cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
   from_port = 8080
   to_port = 8080
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port = 8888
    to_port =8888
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
 ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp" 
   cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "Default Security Group"
  }
}

resource "aws_instance" "ec1" {
  ami = var.linux_ubuntu_ami
  instance_type = "t2.micro"
  key_name = var.open_sesame
  user_data = "${file("install_jenkins.sh")}, ${file("docker_install_with_jenkins.sh")}"
  tags = {
    Name = "Jenkins"
  }
}
   resource "aws_instance" "ec2" {
  ami = var.linux_ubuntu_ami
  instance_type = "t2.micro"
  key_name = var.open_sesame
  user_data = "${file("docker_install.sh")}"
  tags = {
    Name = "Docker"
  }
}
