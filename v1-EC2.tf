provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "demo_server" {
    ami = "ami-0c1fe732b5494dc14"
    instance_type = "t3.micro"
    key_name = "faz"
    vpc_security_group_ids = [aws_security_group.demo_server.id]
    }

resource "aws_security_group" "demo_server" {
  name        = "demo_server"
  description = "allow ssh"
  
  ingress {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

   }

   tags = {
    name = "ssh protocol"

   }

  }


