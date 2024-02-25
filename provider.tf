terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "3.38.0"
        }
    }
    required_version = ">= 0.14.9"
    backend "s3" {
        bucket = "terraform-state-bucket-122"
        key    = "KmsKey/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-state-lock"
    }
}

provider "aws" {
    region =    var.region
}