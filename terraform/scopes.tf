# resource "boundary_scope" "global" {
#   global_scope = true
#   name         = "global"
#   scope_id     = "global"
#    auto_create_admin_role   = true
#   auto_create_default_role = true
# }

#inova company
resource "boundary_scope" "org" {
  scope_id    = "global"
  name        = "Inova"
  description = "Organization scope"

  auto_create_admin_role   = false
  auto_create_default_role = false
}

#project of inova company
resource "boundary_scope" "infra" {
  name                   = "databases"
  description            = "Databases project"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role   = false
  auto_create_default_role = false
}