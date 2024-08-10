resource "aws_sns_topic" "main" {
  name = var.name
}

resource "aws_sns_topic_subscription" "main" {
  topic_arn = aws_sns_topic.main.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}
