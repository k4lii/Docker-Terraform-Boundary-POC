resource "boundary_target" "redis" {
  type                     = "tcp"
  name                     = "redis"
  description              = "Redis server"
  scope_id                 = boundary_scope.infra.id
  session_connection_limit = -1
  session_max_seconds      = 3600
  default_port             = 6379
  host_set_ids = [
    boundary_host_set.redis.id
  ]
}

resource "boundary_target" "mysql" {
  type                     = "tcp"
  name                     = "mysql"
  description              = "MySQL server"
  scope_id                 = boundary_scope.infra.id
  session_connection_limit = -1
  session_max_seconds      = 3600
  default_port             = 3306
  host_set_ids = [
    boundary_host_set.mysql.id
  ]
}