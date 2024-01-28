terraform {
  required_version = "~>1.6.0"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
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
    key            = "terraform.tfstate"
    bucket         = "test123-example1-app1"
    region         = "us-east-1"
    encrypt        = true
  }
}
# test
module "test" {
  source = "git@github.com:cahcommercial/outcomes-aws-ct-tf-module-ec2"
}

module "test2" {
  source = "git@github.com:cahcommercial/outcomes-aws-ct-tf-module-sns"
}

module "test2" {
  source = "git@github.com:cahcommercial/outcomes-aws-ct-tf-module-rds"
}
resource "aws_vpc" "main" {
  cidr_block = "10.2.0.0/16"
}
#resource "aws_vpc" "main" {
  #cidr_block = "10.2.0.0/16"
#}
resource "aws_instance" "foo" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t1.2xlarge" # invalid type!
}
resource "aws_instance" "deb" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t1.2xlarge" # invalid type!
}
# trigger change
