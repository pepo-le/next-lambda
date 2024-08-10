output "arn" {
  value = aws_ecs_task_definition.main.arn
}

output "container_name" {
  value = jsondecode(var.container_definitions)[0].name
}
