variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "region" {
  type    = string
  default = "fra1"
}

variable "db_engine" {
  type    = string
  default = "pg"
}

variable "client_ip_addr" {
  type      = string
  sensitive = true
}

variable "k8s_cluster_id" {
  type = string
}

variable "db_version" {
  type    = string
  default = "14"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "db_size" {
  type    = string
  default = "db-s-1vcpu-1gb"
}
