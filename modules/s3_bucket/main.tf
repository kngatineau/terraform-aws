data "aws_iam_policy_document" "bucket-policy" {
  source_policy_documents = compact([
    var.inline_policy != null ? var.inline_policy : ""
  ])
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket        = var.name
  force_destroy = true
  tags          = {
    name = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = var.name
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
  depends_on              = [aws_s3_bucket.main]
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

resource "aws_s3_bucket_policy" "s3-bucket-policy" {
  count      = var.inline_policy != null ? 1 : 0
  bucket     = var.name
  policy     = data.aws_iam_policy_document.combined_policy[0].json
  depends_on = [ aws_s3_bucket.s3-bucket ]
}
