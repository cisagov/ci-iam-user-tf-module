# ci-iam-user-tf-module #

[![GitHub Build Status](https://github.com/cisagov/ci-iam-user-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/ci-iam-user-tf-module/actions)

This Terraform module creates an IAM user that can assume two roles -
a staging role and a production role.  The intent is that one create
policies that give permissions to access resources in the staging and
production environments and attach them to the corresponding role.

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/ci-iam-user-tf-module"

  role_description = "A role that can be assumed to allow for CI testing of my-repo."
  role_name        = "Test-my-repo"
  user_name        = "test-my-repo"
}
```

## Examples ##

* [Creating a CI test user for Molecule](https://github.com/cisagov/molecule-iam-user-tf-module)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.production | ~> 3.38 |
| aws.staging | ~> 3.38 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_access_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_role.production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.assume_production_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy.assume_staging_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_production_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_staging_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| production\_role\_tags | Extra tags to apply only to the production role resource. | `map(string)` | `{"GitHub_Secret_Name": "TEST_ROLE_TO_ASSUME", "GitHub_Secret_Terraform_Lookup": "arn"}` | no |
| role\_description | The description to associate with the IAM roles that allow this IAM user to do whatever it needs to do in the production and staging environments (e.g. Test the cisagov/ci-iam-user-tf-module repository). | `string` | n/a | yes |
| role\_max\_session\_duration | The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to do whatever it needs to do. | `number` | `3600` | no |
| role\_name | The name to assign the IAM roles that allows allows this IAM user to do whatever it needs to do in the staging and production environments (e.g. TestCIIAMUserTFModule).  Note that a hyphen followed by Staging or Production will appended to this name, so that the staging and production roles are differentiated. | `string` | n/a | yes |
| staging\_role\_tags | Extra tags to apply only to the staging role resource. | `map(string)` | `{}` | no |
| user\_name | The name to associate with the AWS IAM user (e.g. test-ci-iam-user-tf-module). | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| access\_key | The IAM access key associated with the CI IAM user. |
| production\_role | The IAM role that the CI user can assume to do what it needs to do in the production account. |
| staging\_role | The IAM role that the CI user can assume to do what it needs to do in the staging account. |
| user | The CI IAM user. |

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
