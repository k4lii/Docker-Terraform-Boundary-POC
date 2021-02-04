resource "boundary_target" "redis" {
  type                     = "tcp"
  name                     = "redis"
  description              = "Redis server"
  scope_id                 = boundary_scope.infra.id
  session_connection_limit = -1
  session_max_seconds      = 2
  default_port             = 6379
  host_set_ids = [
    boundary_host_set.redis.id
  ]
}
