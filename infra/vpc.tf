output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

# VPCを作成
module "vpc" {
  source                     = "./modules/vpc"
  cidr_block                 = "10.10.0.0/16"
  vpc_name                   = "next-lambda-dev-vpc"
  public_subnet_cidr_blocks  = ["10.10.0.0/24", "10.10.1.0/24"]
  public_availability_zones  = ["us-east-1a", "us-east-1b"]
  private_subnet_cidr_blocks = ["10.10.10.0/24", "10.10.11.0/24"]
  private_availability_zones = ["us-east-1a", "us-east-1b"]
}
