terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.1.3"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.14.1"
    }
  }
  required_version = "~> 1.0"
}
