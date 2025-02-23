module "network" {
  source = "./modules/vpc"

  vpc_name = "vpc1"
  vpc_cidr = var.vpc_cidr
  vpc_public_subnets = var.vpc_public_subnets
  vpc_private_subnets = var.vpc_private_subnets
  vpc_azs = ["eu-west-1a"]
}

module "bastion_host_security_group" {
  source = "./modules/sg"
  sg_name = "bastion-host-security-group"

  vpc_id = module.network.vpc_id

  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = [var.public_ip]

  egress_rules = ["all-all"]
}

module "bastion_host" {
  source = "./modules/ec2"
  aws_region = var.aws_region

  ec2_name = "BastionHost"
  ec2_type = var.ec2_type

  key_pair_name = var.public_key
  subnet_id = module.network.public_subnets[0]
  vpc_security_group_ids = [module.bastion_host_security_group.security_group_id]
}