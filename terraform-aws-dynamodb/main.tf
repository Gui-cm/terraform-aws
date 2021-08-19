provider "aws" {
  version = "3.49.0"
  region  = var.region
  assume_role {
    role_arn = var.role_arn
  }
}

module "dynamodb" {
  source = "./dynamodb"
  environment = "DevOps"

  dynamodb     = var.dynamodb
  dynamodb_asg = var.dynamodb_asg
}