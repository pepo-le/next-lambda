output "domain" {
  value       = aws_cloudfront_distribution.main.domain_name
  description = "CloudFrontのドメイン名"
}

output "arn" {
  value       = aws_cloudfront_distribution.main.arn
  description = "CloudFrontのARN"
}
