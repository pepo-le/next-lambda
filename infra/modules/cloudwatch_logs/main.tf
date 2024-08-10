resource "aws_cloudwatch_log_group" "main" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
}

resource "aws_cloudwatch_log_stream" "main" {
  name           = var.stream_name
  log_group_name = aws_cloudwatch_log_group.main.name
}
