# s3_output.tf:
output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.bucket.arn
}
output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.bucket.id
}
output "s3_bucket_website_endpoint" {
  value       = var.s3_static_web_hosting ? "http://${aws_s3_bucket_website_configuration.static[0].website_endpoint}" : ""
  description = "The S3 bucket website endpoint (only if hosting is enabled)"
}
