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

variable "roles" {
  type = map(object({
    name = string
    principal = object({
      type        = string
      identifiers = list(string)
    })
    managed_policy_arns  = optional(list(string))
    max_session_duration = optional(number)
    tags                 = optional(map(string))

    policies = map(object({
      name = string
      statement = list(object({
        Action   = list(string)
        Effect   = string
        Resource = list(string)
      }))
    }))
  }))
}
