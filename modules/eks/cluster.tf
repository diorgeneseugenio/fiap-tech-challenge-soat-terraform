module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.17.2"

  cluster_name                   = var.cluster_name
  cluster_version                = var.kubernetes_version
  cluster_endpoint_public_access = true # ativa acesso publico ao cluster

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.intra_subnets



  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = var.instance_types

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    cluster-wg = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
      capacity_type  = var.capacity_type

      tags = {
        projetct_name = var.cluster_name
      }
    }
  }
}
