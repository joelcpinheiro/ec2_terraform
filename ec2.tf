resource "aws_instance" "server" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  user_data = "${file("install_docker.sh")}"
 
  tags = {
    Name        = "DKR-${count.index + 1}"
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
    description = "Allow HTTP traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["187.18.129.236/32", "179.182.130.165/32"]
  }
  ingress {
    description = "Allow HTTP traffic on port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["187.18.129.236/32", "179.182.130.165/32"]
  }
  ingress {
    description = "Allow HTTP traffic on port 2368"
    from_port   = 2368
    to_port     = 2368
    protocol    = "tcp"
    cidr_blocks = ["187.18.129.236/32", "179.182.130.165/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

