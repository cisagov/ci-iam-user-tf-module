output "access_key" {
  value       = aws_iam_access_key.key
  description = "The IAM access key associated with the CI IAM user."
  sensitive   = true
}

output "production_role" {
  value       = aws_iam_role.production
  description = "The IAM role that the CI user can assume to do what it needs to do in the production account."
}

output "staging_role" {
  value       = aws_iam_role.staging
  description = "The IAM role that the CI user can assume to do what it needs to do in the staging account."
}

output "user" {
  value       = aws_iam_user.user
  description = "The CI IAM user."
}
