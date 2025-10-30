terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

# TEST MODULE
# module "test" {
#   source = "./modules/test"
# }
# output "test" {
#   value       = module.test.output
# }

# NETWORK MODULE
module "network" {
  source = "./modules/network"
}

# RDS MODULE
# module "rds" {
#   source = "./modules/rds"
#   db_name = var.rds_database
#   password = var.rds_password
#   username = var.rds_username
#   postgrest_security_group_id = module.network.postgres_security_group_id
#   subnet_ids = module.network.default_subnet_ids
# }
#
# variable "rds_database" {}
# variable "rds_password" {}
# variable "rds_username" {}


# EC2 MODULE
module "ec2" {
  source = "./modules/ec2"
  ssh_security_group_id = module.network.ssh_security_group_id
}

# ECS MODULE
module "ecs" {
  source = "./modules/ecs"
  hogwarts_app_target_group_id = module.alb.hogwarts_app_target_group_id
  default_subnet_ids = module.network.default_subnet_ids
  tasks_security_group_id = module.network.tasks_security_group_id
}

# ALB MODULE
module "alb" {
  source = "./modules/alb"
  default_subnet_ids = module.network.default_subnet_ids
  http_security_group_id = module.network.http_security_group_id
  https_security_group_id = module.network.https_security_group_id
  default_vpc_id = module.network.default_vpc_id
}