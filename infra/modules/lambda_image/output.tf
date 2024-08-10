output "id" {
  value = aws_lambda_function.main.id
}

output "arn" {
  value = aws_lambda_function.main.arn
}

output "function_name" {
  value = aws_lambda_function.main.function_name
}

output "function_url" {
  value = aws_lambda_function_url.main.function_url
}
