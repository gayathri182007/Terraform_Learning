provider "aws" {
  region = "us-west-2"
  profile = "default"
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t3.micro"
  

  tags = {
    Name = "HelloWorld"
  }
}

output "instance_id" {
    value = aws_instance.web.id
}