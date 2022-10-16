terraform {

  #backend "kubernetes" {
  #  secret_suffix    = "state"
  #  config_path      = "~/.kube/config"
  #}


  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.14.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }


  }
}

provider "kubernetes" {

  host = "https://localhost:42533"


  client_certificate     = file("/home/anttohha/.minikube/profiles/minikube/client.crt")
  client_key             = file("/home/anttohha/.minikube/profiles/minikube/client.key")
  cluster_ca_certificate = file("/home/anttohha/.minikube/ca.crt")


}
