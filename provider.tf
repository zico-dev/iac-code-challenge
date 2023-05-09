terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
}

provider "docker" {
  # Configuration options
}


provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}
