resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags       = {
    Name = "main"
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.0.0/16"
  availability_zone = "us-east-1b"
}

resource "aws_security_group" "main_sg" {
  vpc_id = aws_vpc.main_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group_rule" "allow_ssh" {
  for_each    = toset(var.allowed_ips)
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${each.value}/32"]
  security_group_id = aws_security_group.main_sg.id
}
