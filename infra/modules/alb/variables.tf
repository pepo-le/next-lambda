variable "name" {
  description = "ALBの名前"
  type        = string
}

variable "internal" {
  description = "内部ALBかどうか"
  type        = bool
  default     = false
}

variable "sg_id" {
  description = "ALBに関連付けるセキュリティグループのID"
  type        = string
}

variable "subnet_ids" {
  description = "ALBを配置するサブネットのIDのリスト"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "削除保護を有効にするかどうか"
  type        = bool
  default     = false
}

variable "listener_port" {
  description = "リスナーのポート"
  type        = number
}

variable "listener_protcol" {
  description = "リスナーのプロトコル"
  type        = string
  default     = "HTTP"
}

variable "certificate_arn" {
  description = "ALBに関連付ける証明書のARN"
  type        = string
  default     = ""
}
