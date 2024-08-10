variable "allocated_storage" {
  description = "RDSインスタンスに割り当てるストレージ容量（ギガバイト）"
  type        = number
}

variable "storage_type" {
  description = "RDSインスタンスに関連付けるストレージのタイプ"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "使用するデータベースエンジン"
  type        = string
}

variable "engine_version" {
  description = "使用するデータベースエンジンのバージョン"
  type        = string
}

variable "instance_class" {
  description = "RDSインスタンスのインスタンスタイプ"
  type        = string
}

variable "db_username" {
  description = "マスターDBユーザーのユーザー名"
  type        = string
}

variable "db_password" {
  description = "マスターDBユーザーのパスワード"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "RDSインスタンスを作成するVPCのID"
  type        = string
}

variable "subnet_ids" {
  description = "RDSインスタンスに関連付けるVPCサブネットIDのリスト"
  type        = list(string)
}

variable "multi_az" {
  description = "RDSインスタンスがマルチAZであるかどうかを指定"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "RDSインスタンスがパブリックにアクセス可能かどうかを指定"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "RDSインスタンスが削除される前に最終DBスナップショットを作成するかどうかを指定"
  type        = bool
  default     = true
}

variable "tags" {
  description = "リソースに割り当てるタグのマッピング"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "RDSインスタンスに関連付けるセキュリティグループのIDのリスト"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "RDSインスタンスに関連付けるDBサブネットグループの名前"
  type        = string
}

variable "parameter_group_name" {
  description = "RDSインスタンスに関連付けるDBパラメータグループの名前"
  type        = string
}

variable "parameter_group_family" {
  description = "DBパラメータグループのファミリー"
  type        = string
}

variable "parameter_group_parameters" {
  description = "パラメータグループに設定するパラメータのマッピング"
  type        = map(string)
  default     = {}
}
