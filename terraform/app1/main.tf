terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }

  # The secret suffix will be provided by Argo
  backend "kubernetes" {
    secret_suffix = "testing"
    namespace = "argo"
  }
}

provider "kubernetes" {}

variable "region" {
  type        = string
  description = "The region to deploy this instance to"
  default = "us-east-1"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "deployment-${var.region}"
    annotations = {
      "other-denied-annotation-1": "deny-me"
    }
  }
}

provider "helm" {

}

resource "helm_release" "echo_server" {
  name       = "echo-server"
  namespace  = kubernetes_namespace.namespace.metadata[0].name
  chart      = "echo-server"
  version    = "0.5.0"
  repository = "https://ealenn.github.io/charts/"
}

resource "random_string" "suffix" {
  length = 12
}