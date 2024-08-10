variable "log_group_name" {
  description = "ロググループの名前"
  type        = string
}

variable "retention_in_days" {
  description = "ログの保持期間（日数）"
  type        = number
  default     = 14
}

variable "stream_name" {
  description = "ログストリームの名前"
  type        = string
}
