# IAM policy document that allows assumption of the CI role
data "aws_iam_policy_document" "assume_ci_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    effect = "Allow"

    resources = [
      aws_iam_role.ci.arn,
    ]
  }
}

# The IAM policy that allows assumption of the CI role
resource "aws_iam_user_policy" "assume_ci_role" {
  name   = "Assume${aws_iam_role.ci.name}"
  policy = data.aws_iam_policy_document.assume_ci_role_doc.json
  user   = aws_iam_user.user.name
}
