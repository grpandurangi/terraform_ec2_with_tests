variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "key_name" {}
variable "security_group_ids" {
  type = list(string)
}
variable "volume_size" {
  default = 8
}
variable "volume_type" {
  default = "gp3"
}
variable "tags" {
  type    = map(string)
  default = {}
}
