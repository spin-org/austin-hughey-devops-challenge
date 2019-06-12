resource "aws_security_group" "spin-app-ssh" {
  name        = "allow_ssh"
  description = "Allows all inbound SSH traffic."
  vpc_id      = "${aws_default_vpc.spin-app-vpc.id}"
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

resource "aws_security_group" "spin-app-8000" {
  name        = "spin-app-8000"
  description = "Allows all inbound TCP traffic on ports 8000-8002."
  vpc_id      = "${aws_default_vpc.spin-app-vpc.id}"
  ingress {
    from_port   = 8000
    to_port     = 8002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "spin-app-8000"
  }
}
