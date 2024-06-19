terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "random_string" "suffix" {
  count = 8
  length = 16
}

#resource "aws_s3_bucket" "bucket" {
#  bucket = "s3-bucket-a"
#}