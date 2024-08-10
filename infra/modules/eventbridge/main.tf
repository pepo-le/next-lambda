resource "aws_cloudwatch_event_rule" "main" {
  name                = var.event_name
  description         = var.event_description
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "main" {
  rule      = aws_cloudwatch_event_rule.main.name
  target_id = var.target_id
  arn       = var.target_arn

  retry_policy {
    maximum_retry_attempts       = var.retry_attempts
    maximum_event_age_in_seconds = var.event_age
  }

  input = var.input != "" ? var.input : null
}
