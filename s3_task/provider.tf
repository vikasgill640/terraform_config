terraform {
  backend "s3" {
    bucket         = "test-teraformstate-bucket"
    key            = "s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "teraform_lockId"
    encrypt        = true
  }
}