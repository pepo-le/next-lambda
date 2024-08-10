output "cloudfront_domain" {
  value = module.cloudfront_web.domain
}

data "aws_cloudfront_cache_policy" "caching_disabled" {
  name = "Managed-CachingDisabled"
}

# CloudFrontを作成
module "cloudfront_web" {
  source     = "./modules/cloudfront"
  cors       = false
  create_oac = true
  oac_name   = "next-app-dev-oai"

  use_cache_and_origin_request_policy = true
  default_cache_behavior = {
    target_origin_id = module.lambda.function_url
    allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods   = ["GET", "HEAD"]

    cache_policy_id          = data.aws_cloudfront_cache_policy.caching_disabled.id
    origin_request_policy_id = null

    viewer_protocol_policy = "allow-all"
  }

  origins = [
    {
      origin_id   = module.lambda.function_url
      domain_name = replace(replace(module.lambda.function_url, "https://", ""), "/", "")
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
      use_oac = false
    },
    {
      origin_id            = module.s3_images.bucket_name
      domain_name          = module.s3_images.bucket_domain_name
      custom_origin_config = null
      use_oac              = true
    }
  ]


  ordered_cache_behaviors = [
    {
      use_cache_and_origin_request_policy = false
      path_pattern                        = "/images/*"
      origin_id                           = module.s3_images.bucket_name
      allowed_methods                     = ["GET", "HEAD"]
      cached_methods                      = ["GET", "HEAD"]

      forwarded_values = {
        headers      = []
        query_string = false
        cookies = {
          forward = "none"
        }
      }

      viewer_protocol_policy = "allow-all"
    }
  ]
}

# S3バケットポリシーでCloudFrontからのアクセスを許可
resource "aws_s3_bucket_policy" "origin_bucket_policy" {
  bucket = module.s3_images.bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${module.s3_images.bucket_arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = module.cloudfront_web.arn
          }
        }
      }
    ]
  })
}
