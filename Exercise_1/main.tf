# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
    region = "us-east-1"
    shared_credentials_files = ["C:/Users/3right/.aws/credentials"]
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "t2MicroInstance" {
  count = 4
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  subnet_id = "subnet-0a28a31bbaed06e07"
  tags = {
    Name = "UdaExecise1"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "m4LargeInstance" {
  count = 2
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "m4.large"
  subnet_id = "subnet-0a28a31bbaed06e07"
  tags = {
    Name = "UdaExecise1"
  }
}