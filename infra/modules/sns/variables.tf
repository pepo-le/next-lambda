variable "name" {
  description = "SNSトピック名"
  type        = string
}

variable "protocol" {
  description = "サブスクリプションのプロトコル"
  type        = string
}

variable "endpoint" {
  description = "サブスクリプションのエンドポイント（メールアドレスなど）"
  type        = string
}
