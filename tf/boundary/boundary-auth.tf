//oidc
resource "boundary_auth_method_oidc" "oidc_auth0" {
  name                 = "Auth0"
  description          = "Default OIDC Auth Method"
  scope_id             = boundary_scope.org.id
  //scope_id             = "o_1234567890"
  type                 = "oidc"
  issuer               = var.issuer
  client_id            = var.client_id
  client_secret        = var.client_secret
  signing_algorithms   = var.signing_algorithms
  api_url_prefix       = "http://localhost:9200"
  is_primary_for_scope = true
}

resource "boundary_account_oidc" "boundary_account_oidc" {
  auth_method_id = boundary_auth_method_oidc.oidc_auth0.id
  description    = "Default OIDC Account"
  issuer         = var.issuer
  subject        = var.subject
  name          = "thio.austin@gmail.com"
}

// Organization

resource "boundary_user" "tio" {
  name        = "tio"
  description = "tio's user resource"
  account_ids = [boundary_account_oidc.boundary_account_oidc.id]
  scope_id    = boundary_scope.org.id
}

resource "boundary_role" "server-admin" {
  name           = "Server Admin Role"
  grant_scope_id = boundary_scope.project-prod-support.id
  grant_strings = [
    "id=${boundary_target.ssh-aws-target.id};actions=*",
    "id=${boundary_target.ssh-gcp-target.id};actions=*",
    "id=*;type=session;actions=cancel:self,read"
  ]
  scope_id      = boundary_scope.org.id
  principal_ids = [boundary_user.tio.id]
}

//passsword
resource "boundary_auth_method" "password" {
  scope_id = boundary_scope.org.id
  type     = "password"
}

resource "boundary_account" "dbadmin" {
  auth_method_id = boundary_auth_method.password.id
  type           = "password"
  login_name     = "dbadmin"
  password       = "password"
}


resource "boundary_user" "dbadmin" {
  name        = "dbadmin"
  description = "dbadmin's user resource"
  account_ids = [boundary_account.dbadmin.id]
  scope_id    = boundary_scope.org.id
}

// Project
//
resource "boundary_role" "psql-admin" {
  name           = "PSQL Admin Role"
  grant_scope_id = boundary_scope.project-prod-support.id
  grant_strings = [
    "id=${boundary_target.psql-target.id};actions=*",
    "id=${boundary_target.mysql-target.id};actions=*",
    "id=*;type=session;actions=cancel:self,read"
  ]
  scope_id      = boundary_scope.org.id
  principal_ids = [boundary_user.dbadmin.id]
}
