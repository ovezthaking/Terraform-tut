provider "aws" {
  profile = "default"
  region = "eu-north-1"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] 
}

resource "aws_instance" "app_server" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"

  tags = {
    Name = "MyNewTerraformInstance"
  }
}