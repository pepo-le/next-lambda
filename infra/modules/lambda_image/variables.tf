variable "function_name" {
  description = "Lambdaの関数名"
  type        = string
}

variable "exec_role_arn" {
  description = "Lambdaの実行ロールARN"
  type        = string
}

variable "memory_size" {
  description = "メモリサイズ"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "タイムアウト時間"
  type        = number
  default     = 3
}

variable "ecr_repository_url" {
  description = "ECRリポジトリのURL"
  type        = string
}

variable "image_tag" {
  description = "ECRリポジトリのタグ"
  type        = string
}

variable "subnet_ids" {
  description = "Lambdaが配置されるサブネットID"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lambdaが配置されるセキュリティグループID"
  type        = list(string)
}

variable "environment_variables" {
  description = "Lambdaの環境変数"
  type        = map(string)
  default     = {}
}

