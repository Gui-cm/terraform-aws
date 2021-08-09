
terraform {
  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]
}

provider "aws" {
  version = "3.49.0"
  region  = var.region
  assume_role {
    role_arn = var.role_arn
  }
}

module "role" {
  source = "./role"
  //version = "0.1.1"

  for_each = var.roles
  role     = each.value
}
