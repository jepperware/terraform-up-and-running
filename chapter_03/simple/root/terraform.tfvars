terragrunt = {
  remote_state {
    backend = "s3"
    config {
      # bucket is defined similarly in s3/main.tf
      bucket         = "statev3.thetastack.co.uk"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "eu-west-1"
      encrypt        = true
      dynamodb_table = "terraform-lock-dev"
    }
  }
}
