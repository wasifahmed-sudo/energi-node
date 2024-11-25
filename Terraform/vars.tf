variable "role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "prod-ci-role"
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = "prod-ci-policy"
}

variable "group_name" {
  description = "The name of the IAM group"
  type        = string
  default     = "prod-ci-group"
}

variable "user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "prod-ci-user"
}
