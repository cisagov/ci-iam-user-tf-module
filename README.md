# ci-iam-user-tf-module #

[![GitHub Build Status](https://github.com/cisagov/ci-iam-user-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/ci-iam-user-tf-module/actions)
[![License](https://img.shields.io/github/license/cisagov/ci-iam-user-tf-module)](https://spdx.org/licenses/)
[![CodeQL](https://github.com/cisagov/ci-iam-user-tf-module/workflows/CodeQL/badge.svg)](https://github.com/cisagov/ci-iam-user-tf-module/actions/workflows/codeql-analysis.yml)

This Terraform module creates an IAM user that can assume a role that can
perform all necessary Continuous Integration (CI) tasks.

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/ci-iam-user-tf-module?ref=v1.0.0"

  role_description = "A role that can be assumed to allow for CI testing of my-repo."
  role_name        = "Test-my-repo"
  user_name        = "test-my-repo"
}
```

## Examples ##

- [Creating a CI test user for Molecule](https://github.com/cisagov/molecule-iam-user-tf-module)

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | >= 1.1 |
| aws | >= 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | >= 4.9 |
| aws.ci | >= 4.9 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_access_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_role.ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.assume_ci_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_ci_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| role\_description | The description to associate with the IAM role that allows this IAM user to do whatever it needs to do (e.g. Test the cisagov/ci-iam-user-tf-module repository). | `string` | n/a | yes |
| role\_max\_session\_duration | The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to do whatever it needs to do. | `number` | `3600` | no |
| role\_name | The name to assign the IAM role that allows this IAM user to do whatever it needs to do (e.g. TestCIIAMUserTFModule). | `string` | n/a | yes |
| user\_name | The name to associate with the AWS IAM user (e.g. test-ci-iam-user-tf-module). | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| access\_key | The IAM access key associated with the CI IAM user. |
| role | The IAM role that the CI user can assume to do what it needs to do. |
| user | The CI IAM user. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is just the main directory,

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
