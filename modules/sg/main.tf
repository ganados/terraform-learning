module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name = var.sg_name

  description = "Security Group with SSH open for one IP, egress open"
  vpc_id      = var.vpc_id

  ingress_rules       = var.ingress_rules
  ingress_cidr_blocks = var.ingress_cidr_blocks

  egress_rules = var.egress_rules
}