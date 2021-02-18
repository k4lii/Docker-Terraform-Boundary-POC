#access type for inova company
resource "boundary_auth_method" "password" {
  name        = "my_password_auth_method"
  description = "Password auth method"
  type        = "password"
  scope_id    = boundary_scope.org.id
}