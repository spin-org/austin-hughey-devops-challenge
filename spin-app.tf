#
#  Put your credentials in $HOME/.aws/credentials on *nix, or in
# "%USERPROFILE%\.aws\credentials" on Windows. See below URL for more info:
#
# https://www.terraform.io/docs/providers/aws/index.html#shared-credentials-file
#
#                                Also see
#
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
#

#
# Speicify the AMI to boot
#
variable "ami" {
  default = "ami-024a64a6685d05041"
  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type, x64
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  # shared_credentials_file = "/Users/tf_user/.aws/creds"
  # profile                 = "customprofile"
}

# Create a VPC
resource "aws_vpc" "spin-app-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "spin-app-vpc"
  }
}

resource "aws_internet_gateway" "spin-app-igw" {
  vpc_id = "${aws_vpc.spin-app-vpc.id}"
  tags = {
    Name = "spin-app-igw"
  }
}

resource "aws_subnet" "spin-app-private-subnet" {
  vpc_id     = "${aws_vpc.spin-app-vpc.id}"
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "spin-app-private-subnet"
  }
}

resource "aws_subnet" "spin-app-public_subnet" {
  vpc_id     = "${aws_vpc.spin-app-vpc.id}"
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "spin-app-public-subnet"
  }
}

resource "aws_route_table" "spin-app-public-route-table" {
  vpc_id = "${aws_vpc.spin-app-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.spin-app-igw.id}"
  }
}

resource "aws_security_group" "spin-app-ssh" {
  name        = "allow_ssh"
  description = "Allows all inbound SSH traffic."
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "spin-app-ssh"
  }
}

resource "aws_instance" "spin-app-tcp" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.spin-app-ssh.id}"]
  key_name               = "jahio"
  tags = {
    Name = "spin-app-tcp1"
  }
}
