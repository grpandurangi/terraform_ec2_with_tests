
mock_provider "aws" {
  alias = "mock"
}

run "plan_create_ec2" {
  command = plan

    providers = {
    aws = aws.mock
  }

module {
  source      = "./modules/ec2"
}

variables {
  ami               = "ami-12345678901234567"
  instance_type     = "t3.dummy"
  subnet_id         = "subnet-xxxxxxxxxxxxxxx"
  key_name          = "dummy"
  security_group_ids = ["sg-00000000000000000"]
  volume_size       = 20
  volume_type       = "gp3"
  tags = {
      Name        = "test-instance"
      Environment = "test"
    }
}

  assert {
  condition     = aws_instance.this.tags["Name"] == "test-instance"
  error_message = "Environment tag should be 'test'"
}

}

run "create_ec2" {
  command = apply

    providers = {
    aws = aws.mock
  }

module {
  source      = "./modules/ec2"
}

variables {
  ami               = "ami-12345678901234567"
  instance_type     = "t3.dummy"
  subnet_id         = "subnet-xxxxxxxxxxxxxxx"
  key_name          = "dummy"
  security_group_ids = ["sg-00000000000000000"]
  volume_size       = 20
  volume_type       = "gp3"
  tags = {
      Name        = "test-instance"
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