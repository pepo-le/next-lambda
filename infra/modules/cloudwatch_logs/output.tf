output "log_group_arn" {
  value       = aws_cloudwatch_log_group.main.arn
  description = "CloudWatch LogsのロググループARN"
}

output "log_group_name" {
  value       = aws_cloudwatch_log_group.main.name
  description = "CloudWatch Logsのロググループ名"
}
