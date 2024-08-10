variable "sg_name" {
  type        = string
  description = "セキュリティグループの名前"
  default     = ""
}

variable "sg_description" {
  type        = string
  description = "セキュリティグループの説明"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "セキュリティグループを作成するVPCのID"
  default     = null
}

variable "rule_map" {
  type = map(object({
    type                     = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    cidr_blocks              = list(string)
    ipv6_cidr_blocks         = list(string)
    source_security_group_id = string
    description              = string
  }))
  default     = {}
  description = "セキュリティグループルールのマップ"
}
