
module "ec2" {
  source            = "./modules/ec2"
  ami                = var.ami
  instance_type      = var.instance_type
  subnet_id          = var.subnet_id
  key_name           = var.key_name
  security_group_ids = var.security_group_ids
  volume_size        = var.volume_size
  volume_type        = var.volume_type
  tags   = local.common_tags
}
