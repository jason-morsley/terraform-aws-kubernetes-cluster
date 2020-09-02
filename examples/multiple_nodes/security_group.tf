#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                                 | |    
#                                 |_|     

module "allow-ssh" {

  source = "./../../../terraform-aws-security-group"

  name = local.name
  description = "Ports for SSH and RKE."

  vpc_id = module.vpc.id

  tags = local.cluster_id_tag

}

//resource "aws_security_group_rule" "allow_all" { # Not recommended for use.
//  type              = "ingress"
//  from_port         = 0
//  to_port           = 0
//  protocol          = "tcp"
//  cidr_blocks       = [local.all_cidr_block]
//  security_group_id = module.allow-ssh.id
//}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [local.all_cidr_block]
  security_group_id = module.allow-ssh.id
}

resource "aws_security_group_rule" "allow_KubeAPI" {
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = [local.all_cidr_block]
  security_group_id = module.allow-ssh.id
}

resource "aws_security_group_rule" "allow_etcd" {
  type              = "ingress"
  from_port         = 2379
  to_port           = 2380
  protocol          = "tcp"
  cidr_blocks       = [local.all_cidr_block]
  security_group_id = module.allow-ssh.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [local.all_cidr_block]
  security_group_id = module.allow-ssh.id
}