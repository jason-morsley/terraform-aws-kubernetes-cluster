terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
    rke = {
      source = "rancher/rke"
      version = "1.1.1"
    }
  }
  required_version = ">= 0.13"
}
