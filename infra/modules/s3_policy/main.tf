resource "aws_s3_bucket_policy" "main" {
  bucket = var.bucket_name
  policy = var.bucket_policy
}
