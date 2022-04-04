terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.3"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "carteira"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  owners = ["137112412989"]
}
