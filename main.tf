provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-3bfab942"
  instance_type = "t2.micro"
  tags {
    Name = "terraform-example"
  }
}
