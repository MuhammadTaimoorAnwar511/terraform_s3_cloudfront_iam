# cloudfront.tf:
# 1. Origin Access Identity so CloudFront can read your private bucket
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.s3_bucket_name}"
}

# 2. (NO policy here any more!)

# 3. CloudFront Distribution (no WAF)
resource "aws_cloudfront_distribution" "cdn" {
  comment             = var.cf_distribution_name
  enabled             = true
  default_root_object = "index.html"
  price_class         = "PriceClass_100"

  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = "s3-${aws_s3_bucket.bucket.id}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-${aws_s3_bucket.bucket.id}"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    default_ttl            = 3600
    max_ttl                = 86400
    min_ttl                = 0

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  }

  viewer_certificate { cloudfront_default_certificate = true }

  restrictions {
    geo_restriction { restriction_type = "none" }
  }
}
