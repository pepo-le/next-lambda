variable "service_name" {
  description = "ECSサービスの名前"
  type        = string
}

variable "cluster_id" {
  description = "クラスターのID"
  type        = string
}

variable "task_definition_arn" {
  description = "タスク定義のARN"
  type        = string
}

variable "desired_count" {
  description = "起動数"
  type        = number
}

variable "launch_type" {
  description = "起動タイプ"
  type        = string
}

variable "subnets" {
  description = "サブネット"
  type        = list(string)
}

variable "security_groups" {
  description = "セキュリティグループ"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "パブリックIPの割り当て"
  type        = string
}

variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "target_group_arn" {
  description = "ターゲットグループのARN"
  type        = string
}

variable "container_name" {
  description = "コンテナ名"
  type        = string
}

variable "container_port" {
  description = "コンテナポート"
  type        = number
}
