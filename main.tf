terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.37"
    }
  }
}

locals {
  s3_buckets = {
    name = "katie-s3-bucket"
  }
  terraform_state_key = "terraform/terraform-state"
}

provider "aws" {
  region  = "us-east-1"
}

module "s3-buckets" {
  for_each = local.s3_buckets
  source = "./modules/s3_bucket"
  name   =  each.value.name
}
