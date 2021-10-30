resource "boundary_host" "rdp-demo" {
  name            = "rdp-demo"
  type            = "static"
  address         = var.rdp_host
  host_catalog_id = boundary_host_catalog.my-host-catalog.id
}

resource "boundary_host_set" "rdp" {
  name            = "RDP hosts set"
  type            = "static"
  host_catalog_id = boundary_host_catalog.my-host-catalog.id
  host_ids = [
    boundary_host.rdp-demo.id
  ]
}

resource "boundary_target" "rdp-target" {
  name         = "RDP Target"
  type         = "tcp"
  default_port = "3389"
  scope_id     = boundary_scope.project-prod-support.id
  host_set_ids = [
    boundary_host_set.rdp.id
  ]
  application_credential_library_ids = [
    boundary_credential_library_vault.kv_rdp.id
  ]
}
