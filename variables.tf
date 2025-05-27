provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "subnet_id" {
  description = "VPC Subnet ID"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "volume_size" {
  default = 10
}

variable "volume_type" {
  default = "gp3"
}
