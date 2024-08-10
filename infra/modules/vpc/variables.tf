variable "cidr_block" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "vpc_name" {
  description = "VPCの名前"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "パブリックサブネットのCIDRブロックのリスト"
  type        = list(string)
}

variable "public_availability_zones" {
  description = "パブリックサブネットが使用するアベイラビリティゾーンのリスト"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "プライベートサブネットのCIDRブロックのリスト"
  type        = list(string)
}

variable "private_availability_zones" {
  description = "プライベートサブネットが使用するアベイラビリティゾーンのリスト"
  type        = list(string)
}
