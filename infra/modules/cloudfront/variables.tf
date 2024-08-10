variable "comment" {
  description = "CloudFrontのコメント"
  type        = string
  default     = ""
}

variable "use_cache_and_origin_request_policy" {
  description = "キャッシュ/オリジンリクエストポリシーを使用するかどうか"
  type        = bool
}

variable "default_cache_behavior" {
  description = "CloudFrontのデフォルトキャッシュ動作"
  type = object({
    target_origin_id         = string
    allowed_methods          = list(string)
    cached_methods           = list(string)
    cache_policy_id          = optional(string)
    origin_request_policy_id = optional(string)
    forwarded_values = optional(object({
      headers      = list(string)
      query_string = bool
      cookies = object({
        forward = string
      })
    }))
    viewer_protocol_policy = string
  })
}

variable "min_ttl" {
  description = "最小TTL"
  type        = number
  default     = 0
}

variable "origins" {
  description = "CloudFrontのオリジンのリスト"
  type = list(object({
    origin_id   = string
    domain_name = string
    custom_origin_config = object({
      http_port              = number
      https_port             = number
      origin_protocol_policy = string
      origin_ssl_protocols   = list(string)
    })
    use_oac = bool
  }))
}

variable "ordered_cache_behaviors" {
  description = "キャッシュ動作のリスト"
  type = list(object({
    use_cache_and_origin_request_policy = bool
    path_pattern                        = string
    origin_id                           = string
    allowed_methods                     = list(string)
    cached_methods                      = list(string)
    cache_policy_id                     = optional(string)
    origin_request_policy_id            = optional(string)
    forwarded_values = optional(object({
      headers      = list(string)
      query_string = bool
      cookies = object({
        forward = string
      })
    }))
    viewer_protocol_policy = string
  }))
}

variable "origin_access_control" {
  description = "CloudFrontのオリジンアクセスコントロール"
  type        = string
  default     = ""
}

variable "price_class" {
  description = "CloudFrontの価格クラス"
  type        = string
  default     = "PriceClass_200"
}

variable "cors" {
  description = "CORSを有効にするかどうか"
  type        = bool
  default     = true
}

variable "create_oac" {
  description = "Origin Access Controlを作成するかどうか"
  type        = bool
  default     = false
}

variable "oac_name" {
  description = "Origin Access Controlの名前"
  type        = string
  default     = ""
}

variable "oac_description" {
  description = "Origin Access Controlの説明"
  type        = string
  default     = ""
}

variable "basic_auth" {
  description = "Basic認証を有効にするかどうか"
  type        = bool
  default     = false
}

variable "function_associations" {
  description = "CloudFront Functionsの関連付け"
  type = list(object({
    event_type   = string
    function_arn = string
  }))
  default = []
}
