#creation des devops_users boundary 
resource "boundary_user" "devops_user" {
  for_each    = var.devops_users
  name        = each.key
  description = "DevOps user : ${each.key}"
  account_ids = [boundary_account.devops_user[each.value].id]
  scope_id    = boundary_scope.org.id
}
# #creation des leadership_users boundary
# resource "boundary_user" "leadership_user" {
#   for_each    = var.leadership_users
#   name        = each.key
#   description = "Leadership user : ${each.key}"
#   account_ids = [boundary_account.leadership_user[each.value].id]
#   scope_id    = boundary_scope.org.id
# }

#creation de la methode d'authentification login/password pour les devops
resource "boundary_account" "devops_user" {
  for_each       = var.devops_users
  name           = each.key
  description    = "User account for ${each.key}"
  type           = "password"
  login_name     = lower(each.key)
  password       = "password"
  auth_method_id = boundary_auth_method.password.id
}

# #creation de la methode d'authentification login/password pour les leadership_users
# resource "boundary_account" "leadership_user" {
#   for_each       = var.leadership_users
#   name           = each.key
#   description    = "User account for ${each.key}"
#   type           = "password"
#   login_name     = lower(each.key)
#   password       = "password"
#   auth_method_id = boundary_auth_method.password.id
# }

# #creation du groupe readonly
# resource "boundary_group" "leadership" {
#   name        = "Leadership"
#   description = "Organization group for leadership users"
#   member_ids  = [for user in boundary_user.leadership_user : user.id]
#   scope_id    = boundary_scope.org.id
# }

#creation du groupe devops
resource "boundary_group" "devops" {
  name        = "DevOps"
  description = "Organization group for devops users"
  member_ids  = [for user in boundary_user.devops_user : user.id]
  scope_id    = boundary_scope.org.id
}
