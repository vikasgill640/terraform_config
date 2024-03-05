
provider "aws" {
  region  = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "test-teraformstate-bucket1"
    key            = "s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "teraform_lockId"
    encrypt        = true
  }
}