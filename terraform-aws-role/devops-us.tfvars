role_arn = "arn:aws:iam::Account_ID:role/Role-Admin"


roles = {
  role1 = {
    name = "testestestes"
    principal = {
      type        = "AWS"
      identifiers = ["arn:aws:iam::ACCOUNT_ID:root"]
    }
    max_session_duration = 32400
    tags = {
      "Managed" = "By Terraform"
    }

    policies = {
      policy1 = {
        name = "policy-testesteste"
        statement = [{
          Action   = ["s3:ListAllMyBuckets"]
          Effect   = "Allow"
          Resource = ["*"]
        }]
      }
    }
  }
}

   