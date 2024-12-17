variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "subscription_tier" {
  type    = string
  default = "basic"
}

variable "region" {
  type    = string
  default = "fra1"
}
