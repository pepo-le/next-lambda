output "iam_role_lambda_exec_role_name" {
  value = module.iam_role_lambda_exec.name
}

output "iam_role_lambda_exec_role_arn" {
  value = module.iam_role_lambda_exec.arn
}

# IAMロールの作成
module "iam_role_lambda_exec" {
  source    = "./modules/iam_role"
  role_name = "next-lambda-exec-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAMポリシーの作成
module "iam_policy_s3_images" {
  source             = "./modules/iam_policy"
  policy_name        = "next-lambda-dev-s3-images-policy"
  policy_description = "next lambda dev s3 images policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Effect   = "Allow",
        Resource = "${module.s3_images.bucket_arn}/*"
      }
    ]
  })
}

module "iam_role_policy_attachment_lambda_s3_images" {
  source     = "./modules/iam_role_policy_attachment"
  role_name  = module.iam_role_lambda_exec.name
  policy_arn = module.iam_policy_s3_images.arn
}

module "iam_role_policy_attachment_lambda_network" {
  source     = "./modules/iam_role_policy_attachment"
  role_name  = module.iam_role_lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}
