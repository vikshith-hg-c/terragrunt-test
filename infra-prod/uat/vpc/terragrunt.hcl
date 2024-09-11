terraform {
    source = "../../../modules/vpc"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    env = "dev"
    vpc_cidr_block = "10.1.0.0/16"
    azs = ["ap-south-1a","ap-south-1b"]
    private_subnets = ["10.1.11.0/24","10.1.12.0/24", "10.1.13.0/24","10.1.14.0/24"]
    public_subnets = ["10.1.101.0/24","10.1.102.0/24", "10.1.103.0/24","10.1.104.0/24"]
    private_tags = {
        "kubernetes.io/role/internal-elb" = 1
        "kubernetes.io/cluster/dev" = "owned"
    }
    public_tags = {
        "kubernetes.io/role/elb" = 1
        "kubernetes.io/cluster/dev" = "owned"
    }
}