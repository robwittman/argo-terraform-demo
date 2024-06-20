terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }

  # The secret suffix will be provided by Argo
  backend "kubernetes" {}
}

provider "kubernetes" {}

variable "region" {
  type = string
  description = "The region to deploy this instance to"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "deployment-${var.region}"
  }
}
