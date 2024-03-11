locals {
  tf_state_bucket_name = "katies-tf-state-bucket"
}

terraform {
  backend "s3" {
    bucket         = "katies-tf-state-bucket"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "alias/tf_bucket_key_alias"
    dynamodb_table = "tf_state"
  }
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = local.tf_state_bucket_name

  tags = {
    Name        = "tf_state_bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "tf_state_bucket_ownership_controls" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_sse" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = aws_kms_key.tf_bucket_key.arn
    }
  }
}

resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.tf_state_bucket_ownership_controls]
  
  bucket     = aws_s3_bucket.tf_state_bucket.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# locking the state file might be a bit overkill when it's just me, but it's good practice
resource "aws_dynamodb_table" "tf_state_lock" {
  name           = "tf_state"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "tf_bucket_key" {
  description             = "The key to encrypt the state bucket"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "tf_bucket_key_alias" {
  name          = "alias/tf_bucket_key_alias"
  target_key_id = aws_kms_key.tf_bucket_key.key_id
}
