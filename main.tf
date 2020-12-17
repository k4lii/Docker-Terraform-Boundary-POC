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
#   recovery_kms_hcl = <<EOT
# kms "aead" {
#   purpose = "recovery"
#   aead_type = "aes-gcm"
#   key = "lvPKw0QaWaaSR5t/AblmfhDkD1F/J+MYH8uKZrgAeds="
#   key_id = "global_recovery"
# }
# EOT
}
