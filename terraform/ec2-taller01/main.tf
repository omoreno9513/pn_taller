# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "icesitaller-aws-terraform"
  
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Crear instancia EC2-web

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Servidor-web"
  }
}


# Crear instancia de EC2-bd

resource "aws_instance" "servidor-bd" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "Servidor-bd"
  }
}


# Crear instancia de EC2-backend

resource "aws_instance" "servidor-backend" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "Servidor-backend"
  }
}