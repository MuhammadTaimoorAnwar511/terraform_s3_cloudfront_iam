# cf_output.tf

output "cf_distribution_id" {
  description = "The CloudFront distribution ID"
  value       = aws_cloudfront_distribution.cdn.id
}

output "cf_domain_name" {
  description = "The CloudFront distribution domain name"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}
