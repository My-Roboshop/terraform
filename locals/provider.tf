terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }

  backend "s3" {
    bucket = "gokul-remote-state-bucket"
    key    = "locals-demo" # to store/save the state file in this name
    region = "us-east-1"
    use_lockfile = true
    encrypt = true # If any unauthorized access, this file will show in encrypted format
  }

}

provider "aws" {
  region = "us-east-1"
}