variable "issuer" {
  default = "https://applikativ.us.auth0.com/"
}

//BoundaryOIDCApp
variable "client_id" {
  default = "ebGHtSQshLZqTHu1GcqioPTOWelt0osO"
}

variable "client_secret" {
  default = ""
}

// thio.austin@gmail.com
variable "subject" {
  default = "auth0|614f2678c69eb2007047b76e"
}

variable "org" {
  default = "hashicorp-sg"
}

variable "signing_algorithms" {
  default = ["RS256"]
}

variable "vault_erp_token_for_boundary" {
  default = "s.F97xJ6cmvr7RNR9xz38zQtus"
}

variable "vault_token_for_boundary" {
  //default = "s.yF6VlQghXqWEZVIHcgGJGK3X"
  default = "s.nFcENaw5ffiU9QskFRENuvXG"
}

variable "vault_fqdn" {
  default = "http://127.0.0.1:8200"
}

variable "vault_psql_dba_path" {
  default = "database/creds/dba"
}

variable "vault_psql_analyst_path" {
  default = "database/creds/analyst"
}

variable "vault_ssh_path" {
  default = "ssh/sign/ubuntu"
}

variable "vault_kv_path_mysql" {
  default = "boundary/mysql-user"
}

variable "vault_kv_path_rdp" {
  default = "boundary/rdp-user"
}

variable "vault_kv_path_aws" {
  default = "boundary/aws-user"
}

variable "aws_host" {
  default = "13.57.35.149"
}
variable "gcp_host" {
  default = "35.240.253.204"
}
variable "rdp_host" {
  default = "13.229.45.203"
}
variable "gke_endpoint" {
  default = "34.132.184.87"
}
