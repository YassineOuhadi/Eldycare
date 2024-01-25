provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eldycare-cluster"
  cluster_version = "1.21"

  subnets = ["subnet-0af154e1ea5025a6b", "subnet-0cc88ba02fb8a36a7", "subnet-0374d3ab0d4715e9e", "subnet-0e04f8052bf1e758a"]

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t2.micro"
    }
  }
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
