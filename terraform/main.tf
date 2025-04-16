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

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.0"
    }
  }
}

// Providers
provider "digitalocean" {
  token = var.do_token
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "cloudflare" {
  api_token = var.cf_token
}

provider "kubernetes" {
  host                   = module.do_cluster.cluster_endpoint
  token                  = module.do_cluster.cluster_token
  cluster_ca_certificate = base64decode(module.do_cluster.cluster_ca_certificate)
}


// Data
data "kubernetes_service" "ingress_controller" {
  metadata {
    name      = "ingress-nginx-controller"
    namespace = "default"
  }
}

// Modules 
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

module "cloudflare_record" {
  source  = "./modules/cloudflare/record"
  zone_id = var.cf_zone_id
  name    = "sisyphus"
  content = data.kubernetes_service.ingress_controller.status[0].load_balancer[0].ingress[0].ip
}
