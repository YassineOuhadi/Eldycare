provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eldycare-cluster"
  cluster_version = "1.21"

  vpc_id       = "vpc-04e1603798ea0e88d"
  subnets      = "subnet-0374d3ab0d4715e9e"

  node_groups = {
    eks_nodes = {
      desired_capacity = 3
      max_capacity     = 3
      min_capaicty     = 3
       instance_type    = "t2.micro"

      instance_type = "t2.small"
    }
  }
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
