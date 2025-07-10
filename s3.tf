// s3.tf

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name
  
  tags = {
    Environment = var.environment
  }

}
resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.s3_block_public_access
  block_public_policy     = var.s3_block_public_access
  ignore_public_acls      = var.s3_block_public_access
  restrict_public_buckets = var.s3_block_public_access
}
resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.s3_versioning
  }
}
resource "aws_s3_bucket_website_configuration" "static" {
  count  = var.s3_static_web_hosting ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  # error_document {
  #   key = "error.html"
  # }

  # Optional routing rules can stay commented or behind a dynamic block
  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
  
}
