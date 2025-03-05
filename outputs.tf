output "access_key" {
  description = "The IAM access key associated with the CI IAM user."
  sensitive   = true
  value       = aws_iam_access_key.key
}

output "role" {
  description = "The IAM role that the CI user can assume to do what it needs to do."
  value       = aws_iam_role.ci
}

output "user" {
  description = "The CI IAM user."
  value       = aws_iam_user.user
}
