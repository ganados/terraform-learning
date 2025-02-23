variable "sg_name" {
  type = string
  description = "Security grupe name"
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}

variable "ingress_rules" {
  type = list(string)
  default = ["ssh-tcp"]
  description = "Security group ingress rules"
}

variable "ingress_cidr_blocks" {
  type = list(string)
  description = "Security group ingress cidr blocks"
}

variable "egress_rules" {
  type = list(string)
  description = "Security group egress rules"
}
