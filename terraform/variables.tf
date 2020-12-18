#devops users -> admins
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
#leadership users -> readonly
variable "leadership_users" {
  type    = set(string)
  default = [
    "Gille",
    "Ludovic"
  ]
}
#target ips
variable "target_ips" {
  type    = set(string)
  default = [
    #"10.1.0.1",
    "localhost"]
}
