variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "region" {
  type    = string
  default = "fra1"
}

variable "version_slug" {
  type    = string
  default = "1.32.2-do.1"
}

variable "node_size" {
  type    = string
  default = "s-1vcpu-2gb"
}

variable "node_count" {
  type    = number
  default = 1
}
