output "access_key" {
  description = "The IAM access key associated with the CI IAM user."
  sensitive   = true
  value       = aws_iam_access_key.key
}

output "production_role" {
  description = "The IAM role that the CI user can assume to do what it needs to do in the production account."
  value       = aws_iam_role.production
}

output "staging_role" {
  description = "The IAM role that the CI user can assume to do what it needs to do in the staging account."
  value       = aws_iam_role.staging
}

output "user" {
  description = "The CI IAM user."
  value       = aws_iam_user.user
}
