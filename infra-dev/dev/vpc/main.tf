terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  backend "local" {
    path = "dev/vpc/terraform.tfstate"
  }
}



provider "aws" {
  alias      = "ap-south-1"
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
    source = "../../../modules/vpc"
    
    env = "dev"
    vpc_cidr_block = "10.1.0.0/16"
    azs = ["ap-south-1a","ap-south-1b"]
    private_subnets = ["10.1.1.0/24","10.1.2.0/24", "10.1.3.0/24","10.1.4.0/24"]
    public_subnets = ["10.1.101.0/24","10.1.102.0/24", "10.1.103.0/24","10.1.104.0/24"]
    private_tags = {
        "kubernetes.io/role/internal-elb" = 1
        "kubernetes.io/cluster/dev" = "owned"
    }
    public_tags = {
        "kubernetes.io/role/elb" = 1
        "kubernetes.io/cluster/dev" = "owned"
    }
    access_key = var.access_key
    secret_key = var.secret_key
}