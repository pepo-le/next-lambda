resource "aws_route53_health_check" "main" {
  disabled          = var.disabled
  fqdn              = var.fqdn
  port              = var.port
  type              = var.type
  resource_path     = var.resource_path
  failure_threshold = var.failure_threshold
  request_interval  = var.request_interval
  measure_latency   = var.measure_latency

  tags = {
    Name = var.name
  }
}

# Route 53ヘルスチェックのアラーム通知を設定
resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = "AWS/Route53"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold

  alarm_description = var.alarm_description
  dimensions = {
    HealthCheckId = aws_route53_health_check.main.id
  }
  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  insufficient_data_actions = var.insufficient_data_actions
}
