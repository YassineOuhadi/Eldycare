provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eldycare-cluster"
  cluster_version = "1.21"

  vpc_id       = "vpc-04e1603798ea0e88d"
}