provider "aws" {
  profile = "default"
  region = "eu-north-1"
}


resource "aws_instance" "app_server" {
  ami = "ami-007868005aea67c54"
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformInstance"
  }
}