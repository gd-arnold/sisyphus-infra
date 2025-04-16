variable "do_token" {
  type      = string
  sensitive = true
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "client_ip_addr" {
  type      = string
  sensitive = true
}

variable "cf_token" {
  type      = string
  sensitive = true
}

variable "cf_zone_id" {
  type      = string
  sensitive = true
}
