provider "aws" {
  region = "us-east-1"
}

variable deploy_environments {
  type    = set(string)
  default = ["dev", "qa", "prod"]
}

module s3_bucket {
  source   = "terraform-aws-modules/s3-bucket/aws"
  for_each = var.deploy_environments

  bucket = "s3-2020-demo-bucket-${each.key}"
  acl    = "private"

  versioning = {
    enabled = true
  }
}
