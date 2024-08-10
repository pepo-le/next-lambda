resource "aws_iam_instance_profile" "main" {
  count = var.instance_profile_name != "" ? 1 : 0
  name  = var.instance_profile_name
  role  = var.iam_role_name
}

resource "aws_instance" "main" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = var.private_ip != "" ? var.private_ip : null
  iam_instance_profile        = var.instance_profile_name != "" ? aws_iam_instance_profile.main[0].id : null

  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  tags = {
    Name = var.tags_name
  }
}

resource "aws_eip" "main" {
  count  = var.associate_eip ? 1 : 0
  domain = "vpc"
}

resource "aws_eip_association" "main" {
  count         = var.associate_eip ? 1 : 0
  instance_id   = aws_instance.main.id
  allocation_id = aws_eip.main[0].id
}
