terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.37"
    }
  }
}

locals {
  s3_bucket_name = "katie-s3-bucket"
  terraform_state_key = "terraform/terraform-state"
}

provider "aws" {
  region  = "us-east-1"
}

data "aws_iam_policy_document" "s3-bucket-policiy-doc" {
    version = "2012-10-17"
  
  statement {
    effect    = "Allow"
    actions   = [ "s3:ListBucket" ]
    resources = [ "arn:aws:s3:::${local.s3_bucket_name}" ]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "s3:GetObject", 
      "s3:PutObject"
    ]
    resources = [ "arn:aws:s3:::katie-s3-bucket/${local.terraform_state_key}" ]
  }
}
