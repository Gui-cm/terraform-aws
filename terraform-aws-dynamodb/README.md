## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.49.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb"></a> [dynamodb](#module\_dynamodb) | ./dynamodb | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb"></a> [dynamodb](#input\_dynamodb) | All of configurations for deploy the tables of the dynamodb | `map` | `{}` | no |
| <a name="input_dynamodb_asg"></a> [dynamodb\_asg](#input\_dynamodb\_asg) | All of configurations for deploy the tables of the dynamodb | `map` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | description | `string` | `"us-east-1"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | role arn | `string` | `""` | no |

## Outputs

No outputs.

### TFVARS

```terraform

role_arn = "arn:aws:iam::Account-ID:role/Role-Admin"

dynamodb = {
  tabela1 = {
    name     = "TABLENAME"
    hash_key = "Id"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5

    attribute = [{
      name = "Id"
      type = "S"
    }]
  }


  tabela2 = {
    name     = "TABLENAME"
    hash_key = "Id"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5

    global_secondary_index = [{
      hash_key        = "Chave"
      attribute_type  = "S"
      name            = "Chave-index"
      projection_type = "ALL"
      read_capacity   = 20
      write_capacity  = 25
    }]

    attribute = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "Chave"
        type = "S"
      }
    ]
  }

}

dynamodb_asg = {
  asg1 = {
    max_capacity       = 40000
    min_capacity       = 5
    resource_id        = "table/TABLENAME"
    scalable_dimension = "dynamodb:table:ReadCapacityUnits"
    service_namespace  = "dynamodb"
  }

  asg2 = {
    max_capacity       = 40000
    min_capacity       = 5
    resource_id        = "table/TABLENAME"
    scalable_dimension = "dynamodb:table:WriteCapacityUnits"
    service_namespace  = "dynamodb"
  },

}
