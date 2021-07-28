terraform {
  /*
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "enkel"

    workspaces {
      prefix = "b2e-aws-elasticache-"
    }
  }
*/
}

provider "aws" {
  version = "3.49.0"
  region  = var.region
  assume_role {
    role_arn = var.role_arn
  }
}

module "elasticache" {
  for_each = var.elasticache
  //version = "0.0.7"
  //source  = "app.terraform.io/enkel/elasticache/aws"
  source = "./elasticache"
  elasticache = each.value
  vpc         = var.vpc
  environment = var.environment

}

