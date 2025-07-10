# iam_variable.tf
variable "iam_user_name" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "taimoor_s3_user"
}

variable "iam_force_password_reset" {
  description = "Whether the IAM user must reset their console password on first login"
  type        = bool
  default     = false
}
