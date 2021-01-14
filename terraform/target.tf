# create target for accessing backend servers on port :5000
resource "boundary_target" "backend_servers_service" {
  type         = "tcp"
  name         = "Backend Redis"
  description  = "Backend Redis target"
  scope_id     = boundary_scope.infra.id
  default_port = "6379"
  session_max_seconds = 3600#temps max de connexion en s
  session_connection_limit = 1

  host_set_ids = [
    boundary_host_set.redis_servers.id
  ]
}
# create target for accessing backend servers on port :2225
resource "boundary_target" "backend_servers" {
  type         = "tcp"
  name         = "Backend mysql"
  description  = "Backend mysql target"
  scope_id     = boundary_scope.infra.id
  default_port = "3306"
  session_max_seconds = 3600#temps max de connexion en s*
  session_connection_limit = 1

  host_set_ids = [
    boundary_host_set.backend_servers.id
  ]
}
