resource "aws_ssm_parameter" "main" {
  name        = var.parameter_name
  description = var.parameter_description
  type        = var.parameter_type
  value       = var.parameter_value
  tags        = var.tags
}
