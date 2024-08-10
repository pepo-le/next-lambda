output "lambd_sg_id" {
  value = module.lambda_sg.id
}

output "lambda_sg_name" {
  value = module.lambda_sg.name
}

module "lambda_sg" {
  source  = "./modules/security_group"
  sg_name = "next-lambda-dev-sg"
  vpc_id  = module.vpc.vpc_id
}

module "sgr_lambda_egress" {
  source                   = "./modules/security_group_rule"
  security_group_id        = module.lambda_sg.id
  type                     = "egress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "TCP"
  cidr_blocks              = ["0.0.0.0/0"]
  ipv6_cidr_blocks         = null
  source_security_group_id = null
  prefix_list_ids          = []
}

# CloudFrontからALBへのリクエストを許可するためのセキュリティグループルール
data "aws_ec2_managed_prefix_list" "cloudfront" {
  name = "com.amazonaws.global.cloudfront.origin-facing"
}

module "sgr_lambda_ingress" {
  source                   = "./modules/security_group_rule"
  security_group_id        = module.lambda_sg.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "TCP"
  cidr_blocks              = null
  ipv6_cidr_blocks         = null
  source_security_group_id = null
  prefix_list_ids          = [data.aws_ec2_managed_prefix_list.cloudfront.id]
}
