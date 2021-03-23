# Create a new EC2 Instance using t2-micro and CentOS 7.9 AMI

#### Requisites
------------

You mmust have installed ```git``` and ```unzip``` package on your GNU Linux to perform this action<br>
You must be had a ```key par``` created on AWS, he's to be used to insert on variables.tf file(line 28).

#### 1. Create a IAM User with ```Programmatic access``` Access type and add permission name ```AmazonEC2FullAccess``` on AWS Console;

#### 2. Clone this project using this command below:

```sh
git clone https://github.com/joelcpinheiro/terraform_ec2.git
```

#### 3. Install AWS-CLI package:

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
unzip awscliv2.zip;
./aws/install
```
#### 4. Add your credential of IAM User created on Step 1, use the ```Access Key ID``` and ```Secret Key``` to configure:

```sh
aws configure
```

#### 5. Install Terraform to running your EC2 Instance:

```sh
curl https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip -o terraform.zip;
unzip terraform.zip;
mv terraform /usr/bin/
```

#### 6. Execute these commands to create an EC2 Instance:

```sh
terraform init
terraform plan
terraform apply
```

#### Now you must to use your key par with .pem extension and connect on your new EC2 Instance, as a example below:

```sh
ssh -i "keyparAWS.pem" centos@ecIPAWS.compute-1.amazonaws.com
```

#### Version
------------

1.0

#### Author
------------
 
 ***Joel Pinheiro** - *Github* - https://github.com/joelcpinheiro/

#### License
------------

Use where you think you will contribute, I hope you enjoy.
