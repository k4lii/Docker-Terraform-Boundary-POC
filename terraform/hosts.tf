#host catalog

resource "boundary_host_catalog" "databases" {
  name        = "databases"
  description = "Databases targets"
  type        = "static"
  scope_id    = boundary_scope.infra.id
}

#host sets

resource "boundary_host_set" "redis" {
  type            = "static"
  name            = "redis"
  description     = "Host set for redis containers"
  host_catalog_id = boundary_host_catalog.databases.id
  host_ids        = [boundary_host.redis.id]
}

resource "boundary_host_set" "mysql" {
  type            = "static"
  name            = "mysql"
  description     = "Host set for mysql containers"
  host_catalog_id = boundary_host_catalog.databases.id
  host_ids        = [boundary_host.mysql.id]
}

#hosts

resource "boundary_host" "redis" {
  type        = "static"
  name        = "redis"
  description = "Private redis container"
  # DNS set via docker-compose
  address         = "192.168.1.31"
  host_catalog_id = boundary_host_catalog.databases.id
}

resource "boundary_host" "mysql" {
  type        = "static"
  name        = "mysql"
  description = "Private mysql container"
  # DNS set via docker-compose
  address         = "mysql"
  host_catalog_id = boundary_host_catalog.databases.id
}