output "repository_url" {
  value       = var.create_repository ? aws_ecr_repository.main[0].repository_url : data.aws_ecr_repository.existing[0].repository_url
  description = "ECRリポジトリのURL"
}
