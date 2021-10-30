resource "boundary_credential_library_vault" "psql_analyst" {
  name                = "ERP PSQL Library"
  description         = "ERP PSQL "
  credential_store_id = boundary_credential_store_vault.vault-erp.id
  path                = var.vault_psql_analyst_path
  http_method         = "GET"
}

