resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}

# Creating a Security Group with these allowing ports
vpc_security_group_ids      = [aws_security_group.sg.id]

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

