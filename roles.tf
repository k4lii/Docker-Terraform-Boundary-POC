#access type for inova company
resource "boundary_auth_method" "password" {
  name     = "Corp Password"
  scope_id = boundary_scope.corp.id
  type     = "password"
}

#creation des devops_users boundary 
resource "boundary_user" "devops_users" {
  for_each    = var.devops_users
  name        = each.key
  description = "User resource for ${each.key}"
  scope_id    = boundary_scope.corp.id
}

#creation des users readonly boundary
resource "boundary_user" "readonly_users" {
  for_each    = var.readonly_users
  name        = each.key
  description = "User resource for ${each.key}"
  scope_id    = boundary_scope.corp.id
}

#creation de la methode d'authentification login/password pour les users
resource "boundary_account" "users_account" {
  for_each       = var.users
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
  scope_id    = boundary_scope.corp.id
}
#creation du groupe devops
resource "boundary_group" "admin" {
  name        = "DevOps"
  description = "Organization group for devops users"
  member_ids  = [for user in boundary_user.devops_users : user.id]
  scope_id    = boundary_scope.corp.id
}
#creation du role read only et put read only aux readonly users
resource "boundary_role" "organization_readonly" {
  name        = "read-only"
  description = "read-only role"
  principal_ids = [boundary_group.readonly.id]
  grant_strings = ["id=*;type=*;actions=read"]
  scope_id    = boundary_scope.corp.id
}
#creation du role read admin et put du role admin aux devops
resource "boundary_role" "organization_admin" {
  name        = "admin"
  description = "Administrator role"
  principal_ids = concat(
    [for user in boundary_user.devops_users: user.id]
  )
  grant_strings   = ["id=*;type=*;actions=create,read,update,delete"]
  scope_id = boundary_scope.corp.id
}