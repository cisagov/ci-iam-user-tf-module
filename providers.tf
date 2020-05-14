# This is the default provider that is used to create the CI user
provider "aws" {
}

# This is the provider that is used to create the CI role inside the
# production account
provider "aws" {
  alias = "production"
}

# This is the provider that is used to create the CI role inside the
# staging account
provider "aws" {
  alias = "staging"
}
