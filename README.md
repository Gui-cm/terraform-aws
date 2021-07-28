## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.49.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_elasticache"></a> [elasticache](#module\_elasticache) | app.terraform.io/enkel/elasticache/aws | 0.0.7 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_elasticache"></a> [elasticache](#input\_elasticache) | All of configurations for deploy the tables of the dynamodb | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | description | `string` | `"us-east-1"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | role arn | `string` | `""` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | All of configurations for deploy the tables of the dynamodb | `map` | `{}` | no |

## Outputs

No outputs.
