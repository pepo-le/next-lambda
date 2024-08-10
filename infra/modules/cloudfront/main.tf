resource "aws_cloudfront_origin_access_control" "main" {
  count                             = var.create_oac ? 1 : 0
  name                              = var.oac_name
  description                       = var.oac_description
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "main" {
  enabled         = true
  is_ipv6_enabled = true
  comment         = var.comment

  default_cache_behavior {
    target_origin_id = var.default_cache_behavior.target_origin_id
    allowed_methods  = var.default_cache_behavior.allowed_methods
    cached_methods   = var.default_cache_behavior.cached_methods

    cache_policy_id          = var.use_cache_and_origin_request_policy ? var.default_cache_behavior.cache_policy_id : null
    origin_request_policy_id = var.use_cache_and_origin_request_policy ? var.default_cache_behavior.origin_request_policy_id : null

    dynamic "forwarded_values" {
      for_each = var.use_cache_and_origin_request_policy ? [] : [var.default_cache_behavior.forwarded_values]
      content {
        headers      = forwarded_values.value.headers
        query_string = forwarded_values.value.query_string
        cookies {
          forward = forwarded_values.value.cookies.forward
        }
      }
    }

    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = 3600
    max_ttl                = 86400

    dynamic "function_association" {
      for_each = var.function_associations

      content {
        event_type   = function_association.value.event_type
        function_arn = function_association.value.function_arn
      }
    }
  }

  dynamic "origin" {
    for_each = var.origins

    content {
      origin_id   = origin.value.origin_id
      domain_name = origin.value.domain_name

      dynamic "custom_origin_config" {
        for_each = origin.value.custom_origin_config != null ? [origin.value.custom_origin_config] : []
        content {
          http_port              = custom_origin_config.value.http_port
          https_port             = custom_origin_config.value.https_port
          origin_protocol_policy = custom_origin_config.value.origin_protocol_policy
          origin_ssl_protocols   = custom_origin_config.value.origin_ssl_protocols
        }
      }

      origin_access_control_id = origin.value.use_oac ? aws_cloudfront_origin_access_control.main[0].id : null
    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behaviors

    content {
      path_pattern     = ordered_cache_behavior.value.path_pattern
      target_origin_id = ordered_cache_behavior.value.origin_id
      allowed_methods  = ordered_cache_behavior.value.allowed_methods
      cached_methods   = ordered_cache_behavior.value.cached_methods

      cache_policy_id = (ordered_cache_behavior.value.use_cache_and_origin_request_policy
      ? ordered_cache_behavior.value.cache_policy_id : null)
      origin_request_policy_id = (ordered_cache_behavior.value.use_cache_and_origin_request_policy
      ? ordered_cache_behavior.value.origin_request_policy_id : null)

      dynamic "forwarded_values" {
        for_each = ordered_cache_behavior.value.use_cache_and_origin_request_policy ? [] : [ordered_cache_behavior.value.forwarded_values]
        content {
          headers      = forwarded_values.value.headers
          query_string = forwarded_values.value.query_string
          cookies {
            forward = forwarded_values.value.cookies.forward
          }
        }
      }
      viewer_protocol_policy = ordered_cache_behavior.value.viewer_protocol_policy
      min_ttl                = 0
      default_ttl            = 3600
      max_ttl                = 86400
    }
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
