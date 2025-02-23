
variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "ec2_name" {
  type    = string
  default = "ec2-instance"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair_name" {
  type        = string
  description = "SSH key pair name"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "VPC security groups"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id"
}