#role permettant d'etre admin de l'org
resource "boundary_role" "org_admin" {
  scope_id       = "global"
  grant_scope_id = boundary_scope.org.id
  grant_strings = ["id=*;type=*;actions=*"]
  principal_ids = concat(
    [for user in boundary_user.devops_user : user.id],
    ["u_auth"]
  )
}

#role permettant d'etre admin sur le projet infra depuis inova
resource "boundary_role" "project_admin" {
  scope_id       = boundary_scope.org.id
  grant_scope_id = boundary_scope.infra.id
  grant_strings = ["id=*;type=*;actions=*"]
  principal_ids = concat(
    [for user in boundary_user.devops_user : user.id],
    ["u_auth"]
  )
}

// #role permettant d'etre en read only sur l'org
// resource "boundary_role" "org_readonly" {
//   name        = "readonly"
//   description = "read-only role for org"
//   scope_id    = boundary_scope.global.id
//   grant_scope_id = boundary_scope.org.id
//   grant_strings = ["id=*;type=*;actions=read,change-password,list"]
//   principal_ids = [
//     boundary_group.leadership.id
//   ]
// }

// #role permettant d'etre en read only sur le projet infra depuis inova
// resource "boundary_role" "project_readonly" {
//   name        = "readonly"
//   description = "read-only role for org"
//   scope_id    = boundary_scope.org.id
//   grant_scope_id = boundary_scope.infra.id
//   grant_strings = ["id=*;type=*;actions=read,change-password"]
//   principal_ids = [
//     boundary_group.leadership.id
//   ]
// }

resource "boundary_role" "global_anon_listing" {
  scope_id = "global"
  grant_strings = [
    "id=*;type=auth-method;actions=list,authenticate",
    "type=scope;actions=list",
    "id={{account.id}};actions=read,change-password"
  ]
  principal_ids = ["u_anon"]
}

resource "boundary_role" "org_anon_listing" {
  scope_id = boundary_scope.org.id
  grant_strings = [
    "id=*;type=auth-method;actions=list,authenticate",
    "type=scope;actions=list",
    "id={{account.id}};actions=read,change-password"
  ]
  principal_ids = ["u_anon"]
}