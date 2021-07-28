variable "region" {
  default = "us-east-1"
}

variable "elasticache" {
  type = object({
    cluster_id               = string
    engine                   = string
    node_type                = string
    num_cache_nodes          = number
    availability_zone        = string
    az_mode                  = string
    snapshot_retention_limit = number
    snapshot_window          = string
    maintenance_window       = string
    port                     = number
    security_group = object({
      name        = string,
      description = string,
      ingress = list(object({
        from        = number,
        to          = number,
        protocol    = string,
        cidr_blocks = optional(list(string))
        security_groups = optional(list(string))
      }))
    })
    subnet_group = object({
      name       = string
      subnet_ids = list(string)
    })
  })
  
  //default     = {}
  description = "All information to create AWS ELASTICACHE"

}

variable "vpc" {
  type        = string
  description = "The aws vpc id, which we will launch the elasticsearch domain"
}

variable "environment" {
  type        = string
  description = "Environment where resources will be created."
}
