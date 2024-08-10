output "tg_arn" {
  value       = aws_lb_target_group.main.arn
  description = "ターゲットグループのARN"
}
