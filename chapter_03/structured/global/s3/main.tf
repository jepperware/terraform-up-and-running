provider "aws" {
  region = "eu-west-1"
}

# maps to 
resource "aws_s3_bucket" "s3-tfstate" {
    bucket = "statev5.thetastack.co.uk"
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

resource "aws_dynamodb_table" "dynamodb-terraform-lock-stage" {
  name = "terraform-lock-stage"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "Terraform Lock Table"
    Org = "Theta Stack Limited"
  }
}
