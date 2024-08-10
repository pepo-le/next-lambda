module "lambda" {
  source        = "./modules/lambda_image"
  function_name = "next-lambda-function"
  exec_role_arn = module.iam_role_lambda_exec.arn
  memory_size   = 256
  timeout       = 10
  environment_variables = {
    PORT = 3000
  }

  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.lambda_sg.id]

  ecr_repository_url = "122534133320.dkr.ecr.us-east-1.amazonaws.com/foo-app-dev-repository"
  image_tag          = "latest"
}

# External data sourceを使用してENI IDを取得
data "external" "lambda_eni_0" {
  program    = ["bash", "./get_lambda_eni.sh", module.lambda.function_name, 0, "us-east-1", "terraform"]
  depends_on = [module.lambda]
}

data "external" "lambda_eni_1" {
  program    = ["bash", "./get_lambda_eni.sh", module.lambda.function_name, 1, "us-east-1", "terraform"]
  depends_on = [module.lambda]
}

resource "aws_eip" "lambda_eni_0" {
  domain            = "vpc"
  network_interface = data.external.lambda_eni_0.result["eni_id"]
}

resource "aws_eip" "lambda_eni_1" {
  domain            = "vpc"
  network_interface = data.external.lambda_eni_1.result["eni_id"]
}
