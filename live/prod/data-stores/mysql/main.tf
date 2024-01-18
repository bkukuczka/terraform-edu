terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-bkukuczka"
    key            = "prod/data-stores/mysql/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "database" {
  source = "../../../../modules/data-stores/mysql"

  db_name = "exampleDbProd"
  db_username = "user"
  db_password = "changeit"
}