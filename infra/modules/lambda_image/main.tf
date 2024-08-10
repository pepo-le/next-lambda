resource "aws_lambda_function" "main" {
  function_name = var.function_name
  role          = var.exec_role_arn
  package_type  = "Image"
  timeout       = var.timeout
  memory_size   = var.memory_size
  image_uri     = "${var.ecr_repository_url}:${var.image_tag}"

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = var.environment_variables
  }
}

resource "aws_lambda_function_url" "main" {
  function_name      = aws_lambda_function.main.function_name
  authorization_type = "NONE"
}
