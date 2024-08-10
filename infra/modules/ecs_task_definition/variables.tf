variable "task_definition_family" {
  description = "タスク定義のファミリー名"
  type        = string
}

variable "network_mode" {
  description = "ネットワークモード"
  type        = string
}

variable "requires_compatibilities" {
  description = "互換性"
  type        = list(string)
}

variable "cpu" {
  description = "CPU"
  type        = string
}

variable "memory" {
  description = "メモリ"
  type        = string
}

variable "task_role_arn" {
  description = "タスクロールのARN"
  type        = string
}

variable "execution_role_arn" {
  description = "実行ロールのARN"
  type        = string
}

variable "container_definitions" {
  description = "コンテナ定義"
  type        = string
}
