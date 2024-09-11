remote_state {
    backend = "local"
    #backend "s3" {
  #  bucket = "vikshith-tf-state" 
  #  key    = "003/terraform.tfstate"
  #  region = "ap-south-1"
  #}
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }

    config = {
        path = "${path_relative_to_include()}/terraform.tfstate"
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
        provider "aws" {
            region = "ap-south-1"
        }
        EOF
}

inputs = {
    access_key = ""
    secret_key = ""

}
