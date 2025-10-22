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

# RDS MODULE
module "rds" {
  source = "modules/rds"
  password = var.rds_password
  username = var.rds_username
}

variable "rds_password" {}
variable "rds_username" {}

output "rds" {
  value       = module.rds.output
  sensitive = true
}

# EC2 MODULE


# ECS MODULE