terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.53.0"
        }
    }
#     backend "s3" {
#     bucket = "mybucket"
#     key    = "foreach-demo"
#     region = "us-east-1"
#   }
}

provider "aws" {
    region = "us-east-1"
}
