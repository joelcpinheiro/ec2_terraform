resource "aws_instance" "server" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
 
  tags = {
    Name        = "K8S-${count.index + 1}"
    Environment = var.env
    Provisioner = "Terraform"
  }
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
    description = "Allow HTTP traffic on port 8081"
    from_port   = 8081
    to_port     = 8081
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

