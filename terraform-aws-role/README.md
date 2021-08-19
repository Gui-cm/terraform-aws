## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.49.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | ./role | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | description | `string` | `"us-east-1"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | role arn | `string` | `""` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | <pre>map(object({<br>    name = string<br>    principal = object({<br>      type        = string<br>      identifiers = list(string)<br>    })<br>    managed_policy_arns  = optional(list(string))<br>    max_session_duration = optional(number)<br>    tags                 = optional(map(string))<br><br>    policies = map(object({<br>      name = string<br>      statement = list(object({<br>        Action   = list(string)<br>        Effect   = string<br>        Resource = list(string)<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.

## TFVARS

```terraform

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

   
