#host catalog
resource "boundary_host_catalog" "databases" {
  name        = "databases"
  description = "Databases targets"
  type        = "static"
  scope_id    = boundary_scope.infra.id
}

#host sets

// resource "boundary_host_set" "local" {
//   type            = "static"
//   name            = "local"
//   description     = "Host set for local servers"
//   host_catalog_id = boundary_host_catalog.databases.id
//   host_ids        = [boundary_host.localhost.id]
// }

resource "boundary_host_set" "redis" {
  type            = "static"
  name            = "redis"
  description     = "Host set for redis containers"
  host_catalog_id = boundary_host_catalog.databases.id
  host_ids        = [boundary_host.redis.id]
}




#hosts
// resource "boundary_host" "localhost" {
//   type            = "static"
//   name            = "localhost"
//   description     = "Localhost host"
//   description     = "Localhost host"
//   address         = "localhost"
//   host_catalog_id = boundary_host_catalog.databases.id
// }

resource "boundary_host" "redis" {
  type        = "static"
  name        = "redis"
  description = "Private redis container"
  # DNS set via docker-compose
  address         = "redis"
  host_catalog_id = boundary_host_catalog.databases.id
}