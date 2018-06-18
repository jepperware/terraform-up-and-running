terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

provider "aws" {
  region = "eu-west-1"
}

# Amazon Linux AMI
resource "aws_instance" "ec2-with-locking" {
    count = 1
    ami = "ami-f90a4880"
    instance_type = "t2.micro"
    
    lifecycle {
      create_before_destroy = true
    }

    tags {
      Name = "DynamoDB lock"
      Org = "Theta Stack Limited"
    }      
}
