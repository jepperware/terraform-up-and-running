terraform {
  backend "s3" {
    # bucket is defined similarly in s3/main.tf
    bucket = "statev3.thetastack.co.uk"
    region = "eu-west-1"
    key = "dev/terraform.tfstate"
    dynamodb_table = "terraform-lock-dev"
    encrypt = true
  }
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
