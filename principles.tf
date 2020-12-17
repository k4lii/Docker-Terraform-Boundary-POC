#creation des devops_users boundary 
resource "boundary_user" "devops_users" {
  for_each    = var.devops_users
  name        = each.key
  description = "DevOps user: ${each.key}"
  account_ids = [ boundary_account.devops_user_acct[each.key].id ]
  scope_id    = boundary_scope.org.id
}
#creation des readonly_users boundary
resource "boundary_user" "readonly_users" {
  for_each    = var.readonly_users
  name        = each.key
  description = "ReadOnly user: ${each.key}"
  account_ids = [ boundary_account.readonly_users_acct[each.key].id ]
  scope_id    = boundary_scope.org.id
}

#creation de la methode d'authentification login/password pour les devops
resource "boundary_account" "devops_user_acct" {
  for_each       = var.devops_users
  name           = each.key
  description    = "User account for ${each.key}"
  type           = "password"
  login_name     = lower(each.key)
  password       = "password"
  auth_method_id = boundary_auth_method.password.id
}

#creation de la methode d'authentification login/password pour les readonly_users
resource "boundary_account" "readonly_users_acct" {
  for_each       = var.readonly_users
  name           = each.key
  description    = "User account for ${each.key}"
  type           = "password"
  login_name     = lower(each.key)
  password       = "password"
  auth_method_id = boundary_auth_method.password.id
}

#creation du groupe readonly
resource "boundary_group" "readonly" {
  name        = "read-only"
  description = "Organization group for readonly users"
  member_ids  = [for user in boundary_user.readonly_users : user.id]
  scope_id    = boundary_scope.org.id
}
#creation du groupe devops
resource "boundary_group" "devops" {
  name        = "DevOps"
  description = "Organization group for devops users"
  member_ids  = [for user in boundary_user.devops_users : user.id]
  scope_id    = boundary_scope.org.id
}