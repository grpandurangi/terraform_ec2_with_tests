provider "aws" {
  alias = "real"
}

run "create_ec2" {
  command = apply

    providers = {
    aws = aws.real
  }

module {
  source      = "./modules/ec2"
}

variables {
  ami               = "ami-0953476d60561c955"
  instance_type     = "t3.micro"
  subnet_id         = "subnet-0a429c219246b165b"
  key_name          = "grpmain"
  security_group_ids = ["sg-0891f6f21c6cb0cde"]
  volume_size       = 20
  volume_type       = "gp3"
  tags = {
      Name        = "Environment"
      Environment = "test"
    }
}



  # Check that the bucket name is correct
 assert {
    condition     = aws_instance.this.id != ""
    error_message = "EC2 instance ID should not be empty"
  }

  assert {
  condition     = aws_instance.this.tags["Environment"] == "test"
  error_message = "Environment tag should be 'test'"
}

}