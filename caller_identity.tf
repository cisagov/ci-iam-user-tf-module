# Get the default caller identity, which corresponds to the Users
# account.  This is needed to determine the Users account ID.
data "aws_caller_identity" "users" {
}
