variable "ubuntu_ami" {
  type        = string
  default     = "ami-0c7217cdde317cfec"
  description = "Ubuntu AMI to install on EC2 instance"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 key pair"
}
