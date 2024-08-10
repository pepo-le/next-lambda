resource "aws_cloudfront_function" "main" {
  name    = var.name
  runtime = "cloudfront-js-2.0"
  code    = var.code
}
