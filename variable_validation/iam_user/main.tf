variable "name" {
  type        = string
  description = "The name of the IAM user to create."

  validation {
    condition     = can(regex("^([0-9A-Za-z=.@-_]*)$", var.name))
    error_message = "The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_."
  }
}

resource "aws_iam_user" "this" {
  name = var.name
  path = "/system/"
}