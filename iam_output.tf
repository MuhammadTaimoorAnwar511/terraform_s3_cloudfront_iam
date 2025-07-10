# iam_output.tf

# 0) Get current account ID
data "aws_caller_identity" "current" {}

output "iam_username" {
  description = "The IAM user name"
  value       = aws_iam_user.user.name
}

output "iam_password" {
  description = "The IAM console password (user may be forced to reset depending on variable)"
  value       = aws_iam_user_login_profile.login.password
  sensitive   = true
}

output "access_key_id" {
  description = "Programmatic access key ID"
  value       = aws_iam_access_key.user_key.id
  sensitive   = true
}

output "secret_access_key" {
  description = "Programmatic secret access key"
  value       = aws_iam_access_key.user_key.secret
  sensitive   = true
}

output "console_signin_url" {
  description = "AWS Console sign-in URL for the new user"
  value       = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}
