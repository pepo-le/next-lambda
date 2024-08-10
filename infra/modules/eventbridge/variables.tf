variable "event_name" {
  description = "EventBridgeのイベント名"
  type        = string
}

variable "event_description" {
  description = "EventBridgeのイベントの説明"
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "EventBridgeのスケジュール式"
  type        = string
}

variable "target_id" {
  description = "EventBridgeのターゲットID"
  type        = string
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

variable "event_age" {
  description = "イベントの最大保持時間"
  type        = number
  default     = 60
}

variable "input" {
  description = "ターゲットに渡す入力"
  type        = string
  default     = ""
}
