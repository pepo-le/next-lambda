variable "instance_type" {
  description = "インスタンスタイプ"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "subnet_id" {
  description = "サブネットID"
  type        = string
}

variable "security_group_ids" {
  description = "セキュリティグループIDs"
  type        = list(string)
}

variable "associate_public_ip_address" {
  description = "パブリックIPアドレスを割り当てるかどうか"
  type        = bool
}

variable "private_ip" {
  description = "プライベートIPアドレス"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "キーペア名"
  type        = string
}

variable "tags_name" {
  description = "Nameタグ"
  type        = string
  default     = ""
}

variable "associate_eip" {
  description = "EIPを割り当てるかどうか"
  type        = bool
}

variable "instance_profile_name" {
  description = "インスタンスプロファイル名"
  type        = string
  default     = ""
}

variable "iam_role_name" {
  description = "アタッチするIAMロールの名前"
  type        = string
  default     = ""
}
