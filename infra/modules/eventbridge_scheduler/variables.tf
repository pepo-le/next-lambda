variable "schedule_name" {
  description = "EventBridgeのイベント名"
  type        = string
}

variable "group_name" {
  description = "EventBridgeのグループ名"
  type        = string
}

variable "flexible_time_window_mode" {
  description = "EventBridgeのフレキシブルタイムウィンドウモード"
  type        = string
  default     = "OFF"
}

variable "schedule_expression" {
  description = "EventBridgeのスケジュール式"
  type        = string
}

variable "schedule_expression_timezone" {
  description = "EventBridgeのスケジュール式のタイムゾーン"
  type        = string
  default     = "Asia/Tokyo"
}

variable "target_arn" {
  description = "EventBridgeのターゲットARN"
  type        = string
}

variable "retry_attempts" {
  description = "リトライ回数"
  type        = number
  default     = 0
}

variable "retry_age" {
  description = "イベントの最大保持時間"
  type        = number
  default     = 60
}

variable "role_arn" {
  description = "ターゲットに渡すロール"
  type        = string
}

variable "input" {
  description = "ターゲットに渡す入力"
  type        = string
  default     = ""
}
