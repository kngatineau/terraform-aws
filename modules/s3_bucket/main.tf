resource "aws_s3_bucket" "s3-bucket" {
  bucket        = var.name
  force_destroy = true
  tags          = {
    name = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-public-access-block" {
  depends_on              = [ aws_s3_bucket.s3-bucket ]  
  bucket                  = var.name
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "s3-bucket-ownership" {
  bucket = var.name
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  depends_on = [ aws_s3_bucket_ownership_controls.s3-bucket-ownership ]
  bucket     = aws_s3_bucket.s3-bucket.id
  acl        = "private"
}
