# iam.tf
resource "aws_iam_user" "user" {
  name = var.iam_user_name
  tags = {
    Environment = var.environment
  }
}

resource "aws_iam_user_login_profile" "login" {
  user                    = aws_iam_user.user.name
  password_length         = 16
  password_reset_required = var.iam_force_password_reset
}

resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy_attachment" "s3_full_access" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
