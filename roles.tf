#role permettant d'etre admin de l'org
resource "boundary_role" "org_admin" {
  name           = "org_admin"
  description    = "Administrator role for org"
  scope_id       = boundary_scope.global.id
  grant_scope_id = boundary_scope.org.id
  grant_strings = ["id=*;type=*;actions=*"]
  # principal_ids = [
  #   boundary_group.devops.id
  # ]
  principal_ids = concat(
    [for user in boundary_user.devops_users : user.id]
  )
}

#role permettant d'etre admin sur le projet infra depuis inova
resource "boundary_role" "project_admin" {
  name           = "infra_admin"
  description    = "Administrator role for infra"
  scope_id       = boundary_scope.org.id
  grant_scope_id = boundary_scope.infra.id
  grant_strings = ["id=*;type=*;actions=*"]
  # principal_ids = [
  #   boundary_group.devops.id
  # ]
  principal_ids = concat(
    [for user in boundary_user.devops_users : user.id]
  )
}

#role permettant d'etre en read only sur l'org
resource "boundary_role" "org_readonly" {
  name        = "readonly"
  description = "read-only role for org"
  scope_id    = boundary_scope.global.id
  grant_scope_id = boundary_scope.org.id
  grant_strings = ["id=*;type=*;actions=read,change-password"]
  principal_ids = [
    boundary_group.leadership.id
  ]
}