output "hostname" {
  value       = aws_db_instance.main.address
  description = "RDSのエンドポイント"
}
