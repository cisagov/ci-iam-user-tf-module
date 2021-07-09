# The production role
resource "aws_iam_role" "production" {
  provider = aws.production

  assume_role_policy   = data.aws_iam_policy_document.assume_role_doc.json
  description          = var.role_description
  max_session_duration = var.role_max_session_duration
  name                 = join("-", [var.role_name, "Production"])
  tags                 = var.production_role_tags
}

# The staging role
resource "aws_iam_role" "staging" {
  provider = aws.staging

  assume_role_policy   = data.aws_iam_policy_document.assume_role_doc.json
  description          = var.role_description
  max_session_duration = var.role_max_session_duration
  name                 = join("-", [var.role_name, "Staging"])
  tags                 = var.staging_role_tags
}
