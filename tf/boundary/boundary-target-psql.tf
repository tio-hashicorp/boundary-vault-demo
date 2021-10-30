resource "boundary_host" "localhost" {
  name            = "localhost"
  type            = "static"
  address         = "127.0.0.1"
  host_catalog_id = boundary_host_catalog.my-host-catalog.id
}

resource "boundary_host_set" "local" {
  name            = "Local hosts set"
  type            = "static"
  host_catalog_id = boundary_host_catalog.my-host-catalog.id
  host_ids = [
    boundary_host.localhost.id
  ]
}

resource "boundary_target" "psql-target" {
  name         = "PSQL Target"
  type         = "tcp"
  default_port = "55432"
  scope_id     = boundary_scope.project.id
  session_connection_limit = -1
  host_set_ids = [
    boundary_host_set.local.id
  ]
  application_credential_library_ids = [
    boundary_credential_library_vault.psql_dba.id
  ]
}
