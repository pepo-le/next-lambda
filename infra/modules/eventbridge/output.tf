output "arn" {
  description = "EventBridgeのルールのARN"
  value       = aws_cloudwatch_event_rule.main.arn
}
