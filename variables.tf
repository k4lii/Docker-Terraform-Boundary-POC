#est-ce vraiment utile ?
variable "users" {
  type    = set(string)
  default = [
    "Lorris",
    "Michel",
    "Guillaume",
    "Tristan",
    "Akram",
    "Frank",
    "Ludovic"
  ]
}


variable "devops_users" {
  type    = set(string)
  default = [
    "Lorris",
    "Michel",
    "Guillaume",
    "Tristan",
    "Akram"
  ]
}

variable "readonly_users" {
  type    = set(string)
  default = [
    "Frank",
    "Ludovic"
  ]
}

variable "backend_server_ips" {
  type    = set(string)
  default = [
    "10.1.0.1",
    "localhost"]
}