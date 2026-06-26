terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "mlops-churn"
}

# Random password for RDS — never hardcode this
resource "random_password" "db_password" {
  length  = 16
  special = false  # avoids RDS-incompatible characters
}