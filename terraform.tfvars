# terraform.tfvars:

#S3 Variables
aws_region     = "us-east-1"
s3_bucket_name = "taimoor-s3-bucket"
s3_block_public_access = false  #i f you want to attach policy donot block public access
s3_versioning = "Disabled"
s3_static_web_hosting = false   #if you want to enbaled/disabled statis website hosting

# CloudFront Variables
cf_distribution_name = "taimoor-s3-cdn"  #description

# iam user
iam_user_name            = "taimoor-s3-iam-user"
iam_force_password_reset = false   # false = no forced reset; true = require reset

