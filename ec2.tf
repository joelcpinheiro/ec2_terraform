resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "niggerkey"

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}


