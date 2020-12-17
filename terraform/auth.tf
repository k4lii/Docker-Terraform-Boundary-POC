#access type for inova company
resource "boundary_auth_method" "password" {
  name     = "org_auth_method"
  scope_id = boundary_scope.org.id
  type     = "password"
}