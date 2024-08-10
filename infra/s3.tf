output "s3_images_bucket_name" {
  value = module.s3_images.bucket_name
}

output "s3_images_bucket_arn" {
  value = module.s3_images.bucket_arn
}

output "s3_images_bucket_domain_name" {
  value = module.s3_images.bucket_domain_name
}

data "aws_caller_identity" "current" {}

# S3バケットを作成
module "s3_images" {
  source      = "./modules/s3"
  bucket_name = "next-lambda-dev-bucket-public-images-${data.aws_caller_identity.current.account_id}"
  is_public   = false
}
