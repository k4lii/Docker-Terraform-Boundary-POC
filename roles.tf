#creation du role read only et put read only aux readonly users
resource "boundary_role" "organization_readonly" {
  name        = "read-only"
  description = "read-only role"
  principal_ids = [boundary_group.readonly.id]
  grant_strings = ["id=*;type=*;actions=read"]
  scope_id    = boundary_scope.org.id
}


#creation du role read admin et put du role admin aux devops
# resource "boundary_role" "organization_admin" {
#   name        = "admin"
#   description = "Administrator role"
#   principal_ids = [boundary_group.devops.id]
#   # principal_ids = concat(
#   #  [for user in boundary_user.devops_users: user.id]
#   # )
#   grant_strings   = ["id=*;type=*;actions=create,read,update,delete"]
#   scope_id = boundary_scope.org.id
# }


resource "boundary_role" "project_admin" {
  name           = "core_infra_admin"
  description    = "Administrator role for core infra"
  scope_id       = boundary_scope.org.id
  grant_scope_id = boundary_scope.infra.id
  grant_strings = [
    "id=*;type=*;actions=*"
  ]
  principal_ids = concat(
    [for user in boundary_user.devops_users : user.id]#,
    #[for user in boundary_user.frontend : user.id],
  )
}