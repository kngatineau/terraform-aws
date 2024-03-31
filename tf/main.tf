terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "ec2_ubuntu_instance" {
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"

  tags = {
    Name = "katies_free_tier_instance"
  }
} 
# just because you *can* generate SSH keys in Terraform doesn't mean you should. 
# this commented code technically worked but having the key in the state file isn't ideal.
#
# resource "tls_private_key" "ssh_private_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
#
# resource "aws_key_pair" "ssh_key" {
#   key_name   = var.key_name
#   public_key = tls_private_key.ssh_private_key.public_key_openssh
# }
#
# resource "local_sensitive_file" "ssh_pem" {
#   count                = var.gen_pem_file ? 1 : 0
#   filename             = pathexpand("~/.ssh/ssh.pem")
#   file_permission      = "600"
#   directory_permission = "700"
#   content              = tls_private_key.ssh_private_key.private_key_pem
# }
