terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


module "my_vpc" {
  source = "./modules/vpc_module"
  base_cidr_block = "80.0.0.0/16"
  vpc_name = "george-vpc-module-tf"
}