terraform {
  required_providers {
    boundary = {
      source = "hashicorp/boundary"
      version = "1.0.5"
    }
  }
}

provider "boundary" {
  addr                            = "http://127.0.0.1:9200"
  auth_method_id                  = "ampw_1234567890"
  password_auth_method_login_name = "admin"
  password_auth_method_password   = "password"
}

// GLOBAL scope
//
resource "boundary_scope" "global" {
  global_scope = true
  scope_id     = "global"
}

// Org scope
//
resource "boundary_scope" "org" {
  name                     = var.org
  scope_id                 = boundary_scope.global.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

// Project scope
//
resource "boundary_scope" "project-prod-support" {
  name                   = "Production Support"
  description            = "Project for Production Support"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}

resource "boundary_scope" "project-northwind-erp" {
  name                   = "Northwind ERP"
  description            = "Project for Northwind ERP"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}


// Prod Support 
//
resource "boundary_host_catalog" "my-host-catalog" {
  name     = "SG Host Catalog"
  type     = "static"
  scope_id = boundary_scope.project-prod-support.id
  //scope_id = boundary_scope.org.id
}

resource "boundary_credential_store_vault" "vault" {
  name        = "Vault Creds Store"
  description = "Production Vault credential store!"
  address     = var.vault_fqdn
  token       = var.vault_token_for_boundary
  scope_id    = boundary_scope.project-prod-support.id
 // scope_id    = boundary_scope.org.id
}

// Northwind ERP
//
resource "boundary_host_catalog" "erp-host-catalog" {
  name     = "ERP Host Catalog"
  type     = "static"
  scope_id = boundary_scope.project-northwind-erp.id
}


resource "boundary_credential_store_vault" "vault-erp" {
  name        = "ERP Vault Creds Store"
  description = "ERP Vault credential store!"
  address     = var.vault_fqdn
  token       = var.vault_erp_token_for_boundary
  scope_id    = boundary_scope.project-northwind-erp.id
}

