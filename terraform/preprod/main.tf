terraform {
  required_version = "~>1.6.0"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.25.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
    #assume_role {
        #role_arn = "arn:aws:iam::${var.account_id}:role/${var.role}"
    #}
}
terraform {
  backend "s3" {
    dynamodb_table = "terraform_state"
    key = "terraform.tfstate"
    bucket = "preprod-example1-app1"
    region="us-east-1"
    encrypt=true
  }
}
resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
}
