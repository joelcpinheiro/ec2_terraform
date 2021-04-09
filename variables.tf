variable "region" {
  description = "Define what region the instance will be deployed"
  default = "us-east-1"
}

variable "name" {
  description = "Name of the Application"
  default = "server01"
}

variable "env" {
  description = "Environment of the Application"
  default = "prod"
}

variable "ami" {
  description = "AWS AMI to be used is centos 7 "
  default = "ami-00e87074e52e6c9f9"
}

variable "instance_type" {
  description = "AWS Instance type defines the hardware configuration of the machine"
  default = "t2.micro"
}

variable "key_name" {
  description = "AWS key using all the time already created for this purpose"
  default = "niggerkey"
}
