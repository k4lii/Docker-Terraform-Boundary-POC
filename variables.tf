#est-ce vraiment utile ?
# variable "users" {
#   type    = set(string)
#   default = [
#     "Lorris",
#     "Michel",
#     "Guillaume",
#     "Tristan",
#     "Akram",
#     "Frank",
#     "Ludovic"
#   ]
# }
#devops
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
#readonly
variable "readonly_users" {
  type    = set(string)
  default = [
    "Frank",
    "Ludovic"
  ]
}
#servers ips
variable "backend_server_ips" {
  type    = set(string)
  default = [
    "10.1.0.1",
    "localhost"]
}