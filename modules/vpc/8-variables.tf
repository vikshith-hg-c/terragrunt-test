variable "env" {
    description = "env name"
    type = string
}

variable "vpc_cidr_block" {
  description = "CIDR"
  type = string
}

variable "azs" {
  description = "avalabilty zones"
  type = list(string)
}

variable "private_subnets" {
    description = "Private subnets"
    type = list(string)
}

variable "public_subnets" {
   description = "public subnets"
    type = list(string)
}

variable "private_tags" {
    description = "Private subnets tags"
    type = map(any)
}

variable "public_tags" {
   description = "public subnets tags"
    type = map(any)
}
