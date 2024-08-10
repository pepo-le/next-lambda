variable "parameter_name" {
  description = "パラメータの名前"
  type        = string
}

variable "parameter_description" {
  description = "パラメータの説明"
  type        = string
  default     = ""
}

variable "parameter_type" {
  description = "パラメータの値のタイプ"
  type        = string
}

variable "parameter_value" {
  description = "パラメータの値"
  type        = string
}

variable "overwrite" {
  description = "既存のパラメータを上書きするかどうかを指定"
  type        = bool
  default     = false
}

variable "tags" {
  description = "リソースに割り当てるタグのマッピング"
  type        = map(string)
  default     = {}
}
