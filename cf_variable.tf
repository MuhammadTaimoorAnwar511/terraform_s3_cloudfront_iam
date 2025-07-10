# cf_variable.tf
variable "cf_distribution_name" {
  description = "Name (comment) for the CloudFront distribution"
  type        = string
  default     = "my-distribution"
}
