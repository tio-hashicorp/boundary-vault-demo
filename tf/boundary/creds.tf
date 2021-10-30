resource "boundary_credential_library_vault" "psql_dba" {
  name                = "PSQL DBA Library"
  description         = "PSQL DBA"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_psql_dba_path
  http_method         = "GET"
}

## public_key below refers to public_key generated from ssh-keygen
## i.e. /Users/tio/.ssh/boundarydemo.pub
resource "boundary_credential_library_vault" "ssh_ubuntu" {
  name                = "SSH Ubuntu Library"
  description         = "SSH Ubuntu"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_ssh_path
  http_method         = "POST"
  http_request_body        = <<EOT
    {
      "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrr9Q1d5lT2ldYP0xxlowJgR2zaHaXtEDsixSmOOpwV4g78+VPdHpL5ruGweuKN8FD6DKX+8Tb1feyI9cMR3C9HlggRkv0iMAamcRQLuCAs7SeAr3pPianCA7bo9AUJZ+dqZ2lbqD1lHCof+YmnW+nO2CQlUGiAHAw0Q/+xNr2M0GUy1J1wRIdMj3kNPw9dOBf4gRs46x3h1ljkDv+8Rbk1Iq/HYBx2BMpSW5QIx/J/T4b9rVL2q38ntyBDoeC5olpbuUNKDyLGnxeHYGBIMAcYPaHIpjwD27DUx6YRHLFVnkk/ortltdQ0V1bc+HopTa3v+gYunODqYQzeXmiAavH tio@tio-C02DR10TML85"
    }
    EOT
}


resource "boundary_credential_library_vault" "kv_mysql" {
  name                = "KV MySQL Library"
  description         = "KV MySQL"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_kv_path_mysql
  http_method         = "GET"
}


resource "boundary_credential_library_vault" "kv_rdp" {
  name                = "KV RDP Library"
  description         = "KV RDP"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_kv_path_rdp
  http_method         = "GET"
}

resource "boundary_credential_library_vault" "kv_aws" {
  name                = "KV AWS SSH"
  description         = "KV AWS"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_kv_path_aws
  http_method         = "GET"
}


