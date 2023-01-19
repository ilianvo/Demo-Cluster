terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}



module "cluster" {
  source = "./modules/cluster"
  region = var.region
  Demo-type = var.Demo-type
  environment = var.environment
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
  cidr = var.cidr
}