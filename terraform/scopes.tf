#global boundary scope
resource "boundary_scope" "global" {
  global_scope = true
  name         = "global"
  scope_id     = "global"
}
#inova company
resource "boundary_scope" "org" {
  name                     = "Inova"
  description              = "Org Scope"
  scope_id                 = boundary_scope.global.id
}
#project of inova company
resource "boundary_scope" "infra" {
  name                   = "databases"
  description            = "Databases project"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}