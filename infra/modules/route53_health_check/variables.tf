variable "disabled" {
  description = "ヘルスチェックの有効/無効"
  type        = bool
}

variable "fqdn" {
  description = "ヘルスチェック対象のFQDN"
  type        = string
}

variable "port" {
  description = "ヘルスチェック対象のポート番号"
  type        = number
}

variable "type" {
  description = "ヘルスチェックのタイプ"
  type        = string
}

variable "resource_path" {
  description = "ヘルスチェック対象のリソースパス"
  type        = string
}

variable "failure_threshold" {
  description = "ヘルスチェックの失敗しきい値"
  type        = number
}

variable "request_interval" {
  description = "ヘルスチェックのリクエスト間隔"
  type        = number
}

variable "measure_latency" {
  description = "レイテンシを測定するかどうか"
  type        = bool
}

variable "name" {
  description = "ヘルスチェックの名前"
  type        = string
}

variable "alarm_name" {
  description = "アラーム名"
  type        = string
}

variable "comparison_operator" {
  description = "比較演算子"
  type        = string
}

variable "metric_name" {
  description = "メトリック名"
  type        = string
}

variable "evaluation_periods" {
  description = "評価データポイント数"
  type        = number
}

variable "period" {
  description = "評価期間（間隔）"
  type        = number
}

variable "statistic" {
  description = "統計定義"
  type        = string
}

variable "threshold" {
  description = "しきい値"
  type        = number
}

variable "alarm_description" {
  description = "アラームの説明"
  type        = string
}

variable "alarm_actions" {
  description = "アラームアクション"
  type        = list(string)
}

variable "ok_actions" {
  description = "OKアクション"
  type        = list(string)
}

variable "insufficient_data_actions" {
  description = "データ不足アクション"
  type        = list(string)
}
