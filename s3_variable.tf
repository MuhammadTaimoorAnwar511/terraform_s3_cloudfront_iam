# s3_variable.tf:
variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name for the S3 bucket"
  type        = string
  default     = "taimoor-s3-bucket"
}

variable "s3_block_public_access" {
  description = "wether to allow public acces or not"
  type = bool
  default = false
}
variable "s3_versioning" {
  description = "Disabled/Enabled s3 bucket versioning"
  type = string
  default = "Disabled" 
}
variable "s3_static_web_hosting" {
  description = "Disabled/Enabled s3 static web hosting"
  type = bool
  default = false
}
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}