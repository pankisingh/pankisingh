provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket            = "terraform-b57"
    key               = "roboshop/shell-scripting/terraform.tfstate"
    region            = "us-east-1"
    dynamodb_table    = "terraform"
  }
}
