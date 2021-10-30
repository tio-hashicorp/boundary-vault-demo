resource "boundary_target" "mysql-target" {
  name         = "MySQL DBA Target"
  type         = "tcp"
  default_port = "3306"
  session_connection_limit = -1
  scope_id     = boundary_scope.project-prod-support.id
  host_set_ids = [
    boundary_host_set.local.id
  ]
  application_credential_library_ids = [
    //todo
    boundary_credential_library_vault.kv_mysql.id
  ]
}
