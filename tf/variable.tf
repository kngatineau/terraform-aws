variable "ubuntu_ami" {
  type        = string
  default     = "ami-0c7217cdde317cfec"
  description = "Ubuntu AMI to install on EC2 instance"
}

variable "lambda_bucket_name" {
  type        = string
  default     = "katies-lambda-bucket"
  description = "Name of the S3 bucket that holds Lambda functions"
}

# variable "key_name" {
#   type        = string
#   default     = "default"
#   description = "Name of the EC2 key pair"
# }

# variable "gen_pem_file" {
#   type        = bool
#   default     = false
#   description = "Generate a new PEM file for the EC2 key pair"
# }

variable "allowed_ips" {
  type        = list(string)
  description = "List of allowed IPs to access the EC2 instance"
}
