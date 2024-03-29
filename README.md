# Create a new EC2 Instance on US-EAST-1 Region(North Virginia) using t2-micro and CentOS 7.9 AMI

#### Requisites

You must have installed ```git``` and ```unzip``` package on your GNU Linux to perform this action;<br>
You must have a ```key par``` on AWS, it will be used to insert on ```variables.tf``` file(line 24).

------------
#### Follow these steps:

#### 1. Access the AWS Web Console and create a IAM User with ```Programmatic access``` access type and add permission name ```AmazonEC2FullAccess```;

#### 2. Clone this project using this command below:

```sh
git clone https://github.com/joelcpinheiro/ec2_terraform.git
```

#### 3. Install AWS CLI version 2 package for linux OS:

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
unzip awscliv2.zip;
sudo ./aws/install
```
#### 4. Add your credential of IAM User created on Step 1, use the ```Access Key ID``` and ```Secret Key``` to configure:

```sh
aws configure
```

#### 5. Now you need to install Terraform to perform a new EC2 Instance:

```sh
curl https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip -o terraform.zip;
unzip terraform.zip;
mv terraform /usr/bin/
```

#### 6. Execute these commands now and try to understand all those steps:

```sh
terraform init
terraform plan
terraform apply
```

#### Now you must to use your key par with .pem extension(created earlier) and connect on your new EC2 Instance, as a example below:

```sh
ssh -i "keypar.pem" centos@ecIPAWS.compute-1.amazonaws.com
```

#### Don't forget to save your .tfstate file in a safe place.

#### Version
------------

1.0

#### Author
------------
 
 ***Joel Pinheiro** - *Github* - https://github.com/joelcpinheiro/

#### License
------------

Use where you think you will contribute, I hope you enjoy.

