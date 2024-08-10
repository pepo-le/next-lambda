output "id" {
  value       = aws_security_group.main.id
  description = "セキュリティグループのID"
}

output "name" {
  value       = aws_security_group.main.name
  description = "セキュリティグループ名"
}
