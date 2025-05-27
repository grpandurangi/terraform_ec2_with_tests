resource "aws_kms_key" "ebs" {
  description             = "KMS key for EBS encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 10
  tags                    = var.tags
}


