# Create a new EC2 Instance using t2-micro and CentOS 7.9 AMI

### Requisites

You already have a key par to insert on variables.tf file. 

### Create a IAM User with Programatic Access on AWS Console

### Clone this project using this command below:

```sh
git clone https://github.com/joelcpinheiro/terraform_ec2.git
```

### Install AWS-CLI package
```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
unzip awscliv2.zip;
./aws/install
```
### Add your credential of IAM User created on Step 1:

```sh
aws configure
```


### Install terraform too
```sh
curl https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip -o terraform.zip;
unzip terraform.zip;
mv terraform /usr/local/bin
```


### Execute these commands to create an Ec2 Instance:
`
```sh
terraform init
terraform plan
terraform apply

```

