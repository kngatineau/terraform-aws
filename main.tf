terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

locals {
  ubuntu_ami = "ami-0c7217cdde317cfec"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "ec2_ubuntu_instance" {
  ami           = local.ubuntu_ami
  instance_type = "t2.micro"

  tags = {
    Name = "katies_free_tier_instance"
  }
}
