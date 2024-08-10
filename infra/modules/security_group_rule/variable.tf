variable "security_group_id" {
  description = "セキュリティグループID"
  type        = string
}

variable "type" {
  description = "セキュリティグループルールのタイプ"
  type        = string
}

variable "from_port" {
  description = "開始ポート"
  type        = number
}

variable "to_port" {
  description = "終了ポート"
  type        = number
}

variable "protocol" {
  description = "プロトコル"
  type        = string
}

variable "cidr_blocks" {
  description = "CIDRブロック"
  type        = list(string)
}

variable "ipv6_cidr_blocks" {
  description = "IPv6 CIDRブロック"
  type        = list(string)
}

variable "source_security_group_id" {
  description = "ソースセキュリティグループID"
  type        = string
}

variable "prefix_list_ids" {
  description = "プレフィックスリストIDs"
  type        = list(string)
}

variable "description" {
  description = "セキュリティグループルールの説明"
  type        = string
  default     = ""
}
