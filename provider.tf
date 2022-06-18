terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.38.0"
    }
  }
}

locals {
  DateTime = formatdate("DD MMM YYYY ", timestamp())
}
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      CreationDate = local.DateTime
      Owner       = "george-nclouds"
    }
  }
}


module "my_vpc" {
  source = "./modules/vpc_module"
  base_cidr_block = "80.0.0.0/16"
  vpc_name = "george-vpc-module-tf"
}
module "my_launch_configuration" {
  source = "./modules/lc_module"
  lc_name = "george-lc-module-tf"
}

module "my_auto_scaling_group" {
  source = "./modules/asg_module"
  lc_name = module.my_launch_configuration.lc_name
  private-subnets=module.my_vpc.private-subnets
}