#est-ce vraiment utile ? tour les users
variable "users" {
  type    = set(string)
  default = [
    "Loris",
    "Micheal",
    "Guile",
    "Trissn",
    "Akra",
    "Fran",
    "Ludo"
  ]
}
#devops
variable "devops_users" {
  type    = set(string)
  default = [
    "Loris",
    "Micheal",
    "Guile",
    "Trissn",
    "Akra"
  ]
}
#readonly
variable "readonly_users" {
  type    = set(string)
  default = [
    "Fran",
    "Ludo"
  ]
}
#servers ips
variable "backend_server_ips" {
  type    = set(string)
  default = [
    #"10.1.0.1",
    "localhost"]
}
