terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "atlantis-demo-bucket-${random_id.suffix.hex}"
  tags = {
    Name        = "Atlantis Demo Bucket"
    Environment = "Test"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

