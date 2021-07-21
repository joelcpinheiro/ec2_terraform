#! /bin/bash
# Install docker and docker-compose on EC2 instance
sudo yum install docker -y && sudo yum install vim wget -y
sudo service docker start
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir prod ; cd prod
sudo wget -O docker-compose.yml https://raw.githubusercontent.com/joelcpinheiro/terraform_ec2/main/docker-compose.yml
sudo docker-compose up -d
sudo yum update -y 