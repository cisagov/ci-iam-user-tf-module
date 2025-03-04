# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "role_description" {
  description = "The description to associate with the IAM role that allows this IAM user to do whatever it needs to do (e.g. Test the cisagov/ci-iam-user-tf-module repository)."
  nullable    = false
  type        = string
}

variable "role_name" {
  description = "The name to assign the IAM role that allows this IAM user to do whatever it needs to do (e.g. TestCIIAMUserTFModule)."
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

variable "role_max_session_duration" {
  default     = 3600
  description = "The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to do whatever it needs to do."
  nullable    = false
  type        = number
}
