#host catalog
resource "boundary_host_catalog" "backend_servers" {
  name        = "backend_servers"
  description = "Backend servers host catalog"
  type        = "static"
  scope_id    = boundary_scope.infra.id
}
#hosts
resource "boundary_host" "backend_servers" {
  for_each        = var.backend_server_ips
  type            = "static"
  name            = "backend_server_service_${each.value}"
  description     = "Backend server host"
  address         = each.key
  host_catalog_id = boundary_host_catalog.backend_servers.id
}
#host sets (a revoir sur le host_ids)
resource "boundary_host_set" "backend_servers_ssh" {
  type            = "static"
  name            = "backend_servers_ssh"
  description     = "Host set for backend servers"
  host_catalog_id = boundary_host_catalog.backend_servers.id
  host_ids        = [for host in boundary_host.backend_servers : host.id]
}