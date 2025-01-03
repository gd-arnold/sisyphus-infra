terraform {
  required_version = ">= 1.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "do_registry" {
  source      = "./modules/digital-ocean/registry"
  name_prefix = "sisyphus"
}

module "do_cluster" {
  source      = "./modules/digital-ocean/cluster"
  name_prefix = "sisyphus"
  depends_on  = [module.do_registry]
}

module "do_database" {
  source         = "./modules/digital-ocean/database"
  name_prefix    = "sisyphus"
  client_ip_addr = var.client_ip_addr
  k8s_cluster_id = module.do_cluster.cluster_id
}
