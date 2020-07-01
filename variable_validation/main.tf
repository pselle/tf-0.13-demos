provider "aws" {
    region = "us-east-1"
}

module "instance" {
  source = "./aws_instance"
  # change this image ID to ami-000b3a073fc20e415
  # in order for the variable to pass validation
  image_id   = "ami-000b3a073fc20e415"
}