variable "username" {
  default     = "badusername"
  description = "This is derived from an environment variable."
}

variable "password" {
  default     = "badpassword_of_16_characters"
  description = "This is derived from an environment variable."
}

variable "defaultzone" {
  default     = "us-west1-a"
  description = "The default zone to use for most things."
}
