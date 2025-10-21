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

# module "test" {
#   source = "./modules/test"
# }
# output "test" {
#   value       = module.test.output
# }

module "rds" {
  source = "./modules/rds"
  password = var.password
  username = var.username
}
variable "password" {}
variable "username" {}

output "rds" {
  value       = module.rds.output
  sensitive = true
}
