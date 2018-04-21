variable "username" {
  default = "badusername"
  description = "This is derived from an environment variable."
}
variable "password" {
  default = "badpassword_of_16_characters"
  description = "This is derived from an environment variable."
}

variable "defaultzone" {
  default = "us-west1-a"
  description = "The default zone to use for most things."
}

variable "kubernetes_hose" {
  description = "Pass this in via terraform inception."
}

variable "client_certificate" {}
variable "client_key" {}
variable "cluster_ca_certificate" {}
