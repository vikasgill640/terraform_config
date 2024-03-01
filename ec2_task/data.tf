data "terraform_remote_state" "peak" {
  backend = "s3"
  config = {
    bucket = "test-teraformstate-bucket"
    region = "us-east-1"
    key = "vpc/terraform.tfstate"
    encrypt = true
  }
}