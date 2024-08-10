variable "bucket_name" {
  description = "S3バケットの名前"
  type        = string
}

variable "is_public" {
  description = "S3バケットを公開するかどうか"
  type        = bool
  default     = false
}

variable "oai_principal" {
  description = "S3バケットにアクセスするIAMユーザー"
  type        = string
  default     = "*"
}
