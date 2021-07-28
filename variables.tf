variable "role_arn" {
  type        = string
  default     = ""
  description = "role arn"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "description"
}

variable "elasticache" {
  //default     = {}
  description = "All of configurations for deploy the tables of the dynamodb"
}

variable "vpc" {
  default     = {}
  description = "All of configurations for deploy the tables of the dynamodb"
}

variable "environment" {
  type        = string
  description = "Environment where resources will be created."
  default = ""
}
