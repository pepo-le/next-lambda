resource "aws_scheduler_schedule" "main" {
  name       = var.schedule_name
  group_name = var.group_name

  flexible_time_window {
    mode = var.flexible_time_window_mode
  }

  schedule_expression          = var.schedule_expression
  schedule_expression_timezone = var.schedule_expression_timezone

  target {
    arn      = var.target_arn
    role_arn = var.role_arn
    input    = var.input != "" ? var.input : null

    retry_policy {
      maximum_retry_attempts       = var.retry_attempts
      maximum_event_age_in_seconds = var.retry_age
    }
  }
}
