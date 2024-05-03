# IAM policy document that allows assumption of the CI role in
# staging.
data "aws_iam_policy_document" "assume_staging_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    effect = "Allow"

    resources = [
      aws_iam_role.staging.arn,
    ]
  }
}

# The IAM policy that allows assumption of the CI role in staging.
resource "aws_iam_user_policy" "assume_staging_role" {
  name   = "Assume${aws_iam_role.staging.name}"
  policy = data.aws_iam_policy_document.assume_staging_role_doc.json
  user   = aws_iam_user.user.name
}

# IAM policy document that allows assumption of the CI role in
# production.
data "aws_iam_policy_document" "assume_production_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    effect = "Allow"

    resources = [
      aws_iam_role.production.arn,
    ]
  }
}

# The IAM policy that allows assumption of the CI role in production.
resource "aws_iam_user_policy" "assume_production_role" {
  name   = "Assume${aws_iam_role.production.name}"
  policy = data.aws_iam_policy_document.assume_production_role_doc.json
  user   = aws_iam_user.user.name
}
