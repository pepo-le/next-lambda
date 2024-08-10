variable "tg_name" {
  description = "ターゲットグループの名前"
  type        = string
}

variable "tg_port" {
  description = "ターゲットグループのポート"
  type        = number
}

variable "tg_protocol" {
  description = "ターゲットグループのプロトコル"
  type        = string
}

variable "tg_vpc_id" {
  description = "ターゲットグループを作成するVPCのID"
  type        = string
}

variable "tg_target_type" {
  description = "ターゲットタイプ"
  type        = string
}

variable "tg_health_check_path" {
  description = "ターゲットグループのヘルスチェックパス"
  type        = string
  default     = "/"
}

variable "listener_arn" {
  description = "リスナーのARN"
  type        = string
}

variable "listener_rule_priority" {
  description = "リスナールールの優先度"
  type        = number
}


variable "listener_rule_action_type" {
  description = "リスナールールのアクションタイプ"
  type        = string
}

variable "listener_rule_host_header" {
  description = "リスナールールが適用されるホストヘッダー"
  type        = string
  default     = "*"
}
