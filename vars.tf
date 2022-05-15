# VARIABLES
variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "name" {
  description = "kms-demo-devops"
  default     = "kms-demo-devops"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
}
