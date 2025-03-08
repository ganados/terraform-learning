data "aws_ami" "al2023_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name          = var.ec2_name
  instance_type = var.ec2_type
  ami           = data.aws_ami.al2023_ami.id

  key_name = var.key_pair_name

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  tags = {
    Name = var.ec2_name
  }
}