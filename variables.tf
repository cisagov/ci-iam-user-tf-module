# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "role_description" {
  description = "The description to associate with the IAM roles that allow this IAM user to do whatever it needs to do in the production and staging environments (e.g. Test the cisagov/ci-iam-user-tf-module repository)."
  nullable    = false
  type        = string
}

variable "role_name" {
  description = "The name to assign the IAM roles that allows allows this IAM user to do whatever it needs to do in the staging and production environments (e.g. TestCIIAMUserTFModule).  Note that a hyphen followed by Staging or Production will appended to this name, so that the staging and production roles are differentiated."
  nullable    = false
  type        = string
}

variable "user_name" {
  description = "The name to associate with the AWS IAM user (e.g. test-ci-iam-user-tf-module)."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "production_role_tags" {
  default = {
    "GitHub_Secret_Name"             = "TEST_ROLE_TO_ASSUME",
    "GitHub_Secret_Terraform_Lookup" = "arn"
  }
  description = "Extra tags to apply only to the production role resource."
  nullable    = false
  type        = map(string)
}

variable "role_max_session_duration" {
  default     = 3600
  description = "The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to do whatever it needs to do."
  nullable    = false
  type        = number
}

variable "staging_role_tags" {
  default     = {}
  description = "Extra tags to apply only to the staging role resource."
  nullable    = false
  type        = map(string)
}
