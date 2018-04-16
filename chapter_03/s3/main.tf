provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "s3-tfstate" {
    bucket = "statev3.thetastack.co.uk"
    acl = "private"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "Terraform S3 tfstate"
      Org = "Theta Stack Limited"
    }      
}
