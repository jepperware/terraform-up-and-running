provider "aws" {
  region = "eu-west-1"
}

resource "aws_dynamodb_table" "dynamodb-terraform-lock-dev" {
  name = "terraform-lock-dev"
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
 
