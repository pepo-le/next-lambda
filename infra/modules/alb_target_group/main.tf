resource "aws_lb_target_group" "main" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.tg_vpc_id
  target_type = var.tg_target_type

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    path                = var.tg_health_check_path
    protocol            = var.tg_protocol
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name = var.tg_name
  }
}

resource "aws_lb_listener_rule" "main" {
  listener_arn = var.listener_arn
  priority     = var.listener_rule_priority

  action {
    type             = var.listener_rule_action_type
    target_group_arn = aws_lb_target_group.main.arn
  }

  condition {
    host_header {
      values = [var.listener_rule_host_header]
    }
  }
}
