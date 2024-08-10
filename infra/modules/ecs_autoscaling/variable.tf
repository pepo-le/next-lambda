variable "cluster_name" {
  description = "ECSクラスタの名前"
  type        = string
}

variable "service_name" {
  description = "ECSサービスの名前"
  type        = string
}

variable "target_cpu_utilization" {
  description = "CPU使用率の目標値"
  type        = number
  default     = 50
}

variable "max_capacity" {
  description = "最大コンテナ数"
  type        = number
}

variable "min_capacity" {
  description = "最小コンテナ数"
  type        = number
}

variable "scaling_policy_name" {
  description = "スケーリングポリシーの名前"
  type        = string
}

variable "scale_in_cooldown" {
  description = "スケールインのクールダウン時間（秒）"
  type        = number
  default     = 300
}

variable "scale_out_cooldown" {
  description = "スケールアウトのクールダウン時間（秒）"
  type        = number
  default     = 300
}
