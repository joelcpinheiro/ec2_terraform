resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
 
  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}

# Creating a Security Group with these allowing ports

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TCP/80 & TCP/22"
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["187.18.129.236/32"]
  }
  ingress {
    description = "Allow HTTPD traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["187.18.129.236/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

