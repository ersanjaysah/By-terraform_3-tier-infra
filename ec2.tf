resource "aws_instance" "web_server1" {
  ami                         = "ami-0014ce3e52359afbd"
  instance_type               = "t3.micro"
  key_name                    = "docker"
  subnet_id                   = aws_subnet.public_subnet.id
  security_groups             = [aws_security_group.nginx_SG.id]
  associate_public_ip_address = true

  tags = {
    Name = "nginx-tf-server"
  }
}

resource "aws_instance" "app_server1" {
  ami                         = "ami-0014ce3e52359afbd"
  instance_type               = "t3.micro"
  key_name                    = "docker"
  subnet_id                   = aws_subnet.private_subnet.id
  security_groups             = [aws_security_group.pvt_subnet1_SG.id]
  associate_public_ip_address = true
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 15
    delete_on_termination = true
  }

  tags = {
    Name = "app-server-tf"
  }
}

resource "aws_instance" "db_server" {
  ami                         = "ami-0014ce3e52359afbd"
  instance_type               = "t3.small"
  key_name                    = "docker"
  subnet_id                   = aws_subnet.private_subnet-2.id
  security_groups             = [aws_security_group.DB_server_SG.id]
  associate_public_ip_address = true
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  tags = {
    Name = "DB-server-tf"
  }
}





