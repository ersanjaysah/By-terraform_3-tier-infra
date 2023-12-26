resource "aws_security_group" "nginx_SG" {
  name        = "nginx-SG"
  description = "this sg of nginx by tf"
  vpc_id      = aws_vpc.custom_VPC.id

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}

resource "aws_security_group" "pvt_subnet1_SG" {
  name        = "pvt-subnet1-SG"
  description = "allowed all traffic of nginx server"
  vpc_id      = aws_vpc.custom_VPC.id

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.168.1.0/24"]
  }

  ingress {
    description = "allow all traffic from nginx server"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.168.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pvt-subnet1-sg"
  }
}

resource "aws_security_group" "DB_server_SG" {
  name        = "db-subnet-SG"
  description = "allowed all traffic of app server"
  vpc_id      = aws_vpc.custom_VPC.id

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.168.2.0/24"]
  }

  ingress {
    description = "allow all traffic from app server"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.168.2.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-server-sg"
  }
}



