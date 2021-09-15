resource "aws_instance" "server" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  user_data = "${file("scripts/install_docker.sh")}"
 
  tags = {
    Name        = "DKR-${count.index + 1}"
    Environment = var.env
    Provisioner = "Terraform"
  }
}

# Single EIP associate with the new instance
  resource "aws_eip" "lb" {
    instance = aws_instance.web.id
    vpc      = true
}

# Creating a Security Group with these allowing ports

resource "aws_security_group" "sg" {
  name        = "sg_new"
  description = "Allow TCP/80 & TCP/22"
  ingress {
    description = "Allow access to por 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["187.18.129.236/32"]
  }
  ingress {
    description = "Allow HTTP traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP traffic on port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow ICMP ping traffic"
    from_port   = 1
    to_port     = 1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

