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
