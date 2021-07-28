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

### TFVARS

```terraform

role_arn = "arn:aws:iam::EXAMPLE:role/Role-Admin"
vpc      = "vpc-EXAMPLE"
environment = "EXAMPLE"

elasticache = {
  redis1 = {
    cluster_id               = "svc-redis"
    engine                   = "redis"
    node_type                = "cache.t2.medium"
    num_cache_nodes          = 1
    parameter_group_name     = "cache.redis3.2"
    availability_zone        = "us-east-1b"
    az_mode                  = "single-az"
    snapshot_retention_limit = 0
    snapshot_window          = "09:00-10:00"
    maintenance_window       = "wed:04:00-wed:05:00"
    port                     = "6379"
    security_group = {
      name        = "sg_poc_teste"
      description = "Security group for Elasticache POC"
      ingress = [{
        from        = 443,
        to          = 443,
        protocol    = "tcp",
        cidr_blocks = ["0.0.0.0/0"]
      }]
    }
    subnet_group = {
      name = "teste"
      subnet_ids = [
        "subnet-auihsua",
        "subnet-uashuah"
      ]
    }
  }
}
