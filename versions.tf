terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "%USERPROFILE%\\.aws\\credentials"
  profile                 = "vscode"
}