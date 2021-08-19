variable "environment" {
  type        = string
  description = "Environment where resources will be created."
}

variable "dynamodb" {
  type = map(object({
    name           = string
    hash_key       = string
    billing_mode   = string
    read_capacity  = number
    write_capacity = number
    global_secondary_index = optional(list(object({
      name = string
      hash_key        = string
      projection_type = string
      read_capacity   = number
      write_capacity  = number
    })))

    attribute = list(object({
      name = string
      type = string
    }))
    
  }))

  default     = {}
  description = "All informations to create AWS DYNAMODB TABLE"

}

variable "dynamodb_asg" {
  /*
  type = map(object({
    max_capacity       = number
    min_capacity       = number
    resource_id        = string
    scalable_dimension = string
    service_namespace  = string
  }))
  */

  default     = {}
  description = "All informations to create AWS DYNAMODB TABLE WITH APP ASG"
}

variable "dynamo_asg_policy" {
  type = map(object({
    name               = string
    policy_type        = string
    resource_id        = string
    scalable_dimension = string
    service_namespace  = string
  }))

  default     = {}
  description = "All informations to create AWS DYNAMODB TABLE WITH APP ASG"
}

variable "target_asg" {
  type    = number
  default = 70
}