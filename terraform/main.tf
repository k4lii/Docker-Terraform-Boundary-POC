terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "0.1.0"
    }
  }
}

provider "boundary" {
  addr             = "http://127.0.0.1:9200"
  auth_method_id                  = "ampw_1234567890"
    password_auth_method_login_name = "admin"
  password_auth_method_password   = "password"
   recovery_kms_hcl  = <<EOT
 kms "aead" {
  purpose = "recovery"
  aead_type = "aes-gcm"
  key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
  key_id = "global_root"
}
 EOT
}