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

variable "dynamodb" {
  default     = {}
  description = "All of configurations for deploy the tables of the dynamodb"
}

variable "dynamodb_asg" {
  default     = {}
  description = "All of configurations for deploy the tables of the dynamodb"
}