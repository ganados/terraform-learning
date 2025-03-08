variable "public_key" {
  type        = string
  description = "SSH public key path"
}

variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "public_ip" {
  type = string
}

variable "vpc_cidr" {
  type        = string
  description = "VPC cidr"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "VPC public subnets cidr"
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "VPC private subnets cidr"
}