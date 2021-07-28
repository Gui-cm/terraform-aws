terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "organization_name"

    workspaces {
      prefix = "workspace_name"
    }
  }

}

provider "aws" {
  version = "3.49.0"
  region  = var.region
  assume_role {
    role_arn = var.role_arn
  }
}

module "elasticache" {
  for_each    = var.elasticache
  version     = "0.0.18"
  source      = "ref_your_module"
  elasticache = each.value
  vpc         = var.vpc
  environment = var.environment

}

