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
  type        = string
  description = "The region to deploy this instance to"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "deployment-${var.region}"
  }
}

provider "helm" {

}

resource "helm_release" "echo_server" {
  name       = "echo-server"
  namespace  = var.region
  chart      = "echo-server"
  version    = "0.5.0"
  repository = "https://ealenn.github.io/charts/"
}