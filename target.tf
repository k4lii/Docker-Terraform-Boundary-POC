# create target for accessing backend servers on port :5000
resource "boundary_target" "backend_servers_service" {
  type         = "tcp"
  name         = "Backend service"
  description  = "Backend service target"
  scope_id     = boundary_scope.infra.id
  default_port = "5000"

  host_set_ids = [
    boundary_host_set.backend_servers_ssh.id
  ]
}
# create target for accessing backend servers on port :2225
resource "boundary_target" "backend_servers_ssh" {
  type         = "tcp"
  name         = "Backend servers"
  description  = "Backend SSH target"
  scope_id     = boundary_scope.infra.id
  default_port = "2225"

  host_set_ids = [
    boundary_host_set.backend_servers_ssh.id
  ]
}
