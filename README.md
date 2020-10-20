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

  tags = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}
```

## Examples ##

* [Creating a CI test user for Molecule](https://github.com/cisagov/molecule-iam-user-tf-module)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| aws.production | ~> 3.0 |
| aws.staging | ~> 3.0 |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| production_role_tags | Extra tags to apply only to the production role resource | `map(string)` | `{"GitHub_Secret_Name": "TEST_ROLE_TO_ASSUME", "GitHub_Secret_Terraform_Lookup": "arn"}` | no |
| role_description | The description to associate with the IAM roles that allow this IAM user to do whatever it needs to do in the production and staging environments (e.g. Test the cisagov/ci-iam-user-tf-module repository). | `string` | n/a | yes |
| role_max_session_duration | The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to do whatever it needs to do. | `number` | `3600` | no |
| role_name | The name to assign the IAM roles that allows allows this IAM user to do whatever it needs to do in the staging and production environments (e.g. TestCIIAMUserTFModule).  Note that a hyphen followed by Staging or Production will appended to this name, so that the staging and production roles are differentiated. | `string` | n/a | yes |
| staging_role_tags | Extra tags to apply only to the staging role resource | `map(string)` | `{}` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |
| user_name | The name to associate with the AWS IAM user (e.g. test-ci-iam-user-tf-module). | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| access_key | The IAM access key associated with the CI IAM user. |
| production_role | The IAM role that the CI user can assume to do what it needs to do in the production account. |
| staging_role | The IAM role that the CI user can assume to do what it needs to do in the staging account. |
| user | The CI IAM user. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
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
