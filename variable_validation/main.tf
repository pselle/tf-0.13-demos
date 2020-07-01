provider "aws" {
    region = "us-east-1"
}

module "iam_user" {
  source = "./iam_user"
  # remove the exclamation point here
  # for the variable to pass validation
  name   = "jane!"
}