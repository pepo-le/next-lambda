# 既存のECRリポジトリをチェック
data "aws_ecr_repository" "existing" {
  count = var.create_repository ? 0 : 1
  name  = var.repository_name
}

resource "aws_ecr_repository" "main" {
  count                = length(data.aws_ecr_repository.existing) == 0 ? 1 : 0
  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability
}
