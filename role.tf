# The CI role
resource "aws_iam_role" "ci" {
  provider = aws.ci

  assume_role_policy   = data.aws_iam_policy_document.assume_role_doc.json
  description          = var.role_description
  max_session_duration = var.role_max_session_duration
  name                 = var.role_name
  tags = {
    "GitHub_Secret_Name"             = "TEST_ROLE_TO_ASSUME",
    "GitHub_Secret_Terraform_Lookup" = "arn"
  }
}
