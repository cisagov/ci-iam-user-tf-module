<<<<<<< HEAD
output "access_key" {
  value       = aws_iam_access_key.key
  description = "The IAM access key associated with the CI IAM user."
  sensitive   = true
}

output "production_role" {
  value       = aws_iam_role.production
  description = "The IAM role that the CI user can assume to do what it needs to do in the production account."
=======
output "arn" {
  value       = aws_instance.example.arn
  description = "The EC2 instance ARN"
>>>>>>> 365f6dd6e7aaaafb892727e8556c7a63e9eaf57b
}

output "staging_role" {
  value       = aws_iam_role.staging
  description = "The IAM role that the CI user can assume to do what it needs to do in the staging account."
}

<<<<<<< HEAD
output "user" {
  value       = aws_iam_user.user
  description = "The CI IAM user."
=======
output "id" {
  value       = aws_instance.example.id
  description = "The EC2 instance ID"
}

output "private_ip" {
  value       = aws_instance.example.private_ip
  description = "The private IP of the EC2 instance"
}

output "subnet_id" {
  value       = aws_instance.example.subnet_id
  description = "The ID of the subnet where the EC2 instance is deployed"
>>>>>>> 365f6dd6e7aaaafb892727e8556c7a63e9eaf57b
}
