variable "ubuntu_ami" {
  type        = string
  default     = "ami-0c7217cdde317cfec"
  description = "Ubuntu AMI to install on EC2 instance"
}

variable "key_name" {
  type        = string
  default     = "default"
  description = "Name of the EC2 key pair"
}

variable "gen_pem_file" {
  type        = bool
  default     = false
  description = "Generate a new PEM file for the EC2 key pair"
}
