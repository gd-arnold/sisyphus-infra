variable "zone_id" {
  type      = string
  sensitive = true
}

variable "type" {
  type    = string
  default = "A"
}

variable "name" {
  type    = string
  default = "@"
}

variable "content" {
  type = string
}

variable "proxied" {
  type    = bool
  default = true
}

variable "ttl" {
  type    = number
  default = 1
}
