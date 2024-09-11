terraform {
    source = "../../../modules/vpc"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    env = "pqa"
    vpc_cidr_block = "10.2.0.0/16"
    azs = ["ap-south-1a","ap-south-1b"]
    private_subnets = ["10.2.11.0/24","10.2.12.0/24", "10.2.13.0/24","10.2.14.0/24"]
    public_subnets = ["10.2.101.0/24","10.2.102.0/24", "10.2.103.0/24","10.2.104.0/24"]
    private_tags = {
        "kubernetes.io/role/internal-elb" = 1
        "kubernetes.io/cluster/dev" = "owned"
    }
    public_tags = {
        "kubernetes.io/role/elb" = 1
        "kubernetes.io/cluster/dev" = "owned"
    }
}