resource "aws_vpc" "custom_VPC" {
  cidr_block       = "172.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-custom-vpc"
  }
}

resource "aws_internet_gateway" "custom_IGW" {
  vpc_id = aws_vpc.custom_VPC.id

  tags = {
    Name = "custom-IGW"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.custom_VPC.id
  cidr_block        = "172.168.1.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_IGW.id
  }

  tags = {
    Name = "custom_RT"
  }
}

resource "aws_route_table_association" "custom_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}

// private subnet-1
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.custom_VPC.id
  cidr_block        = "172.168.2.0/24"
  availability_zone = "eu-north-1b"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_eip" "custom_EPI" {
  network_border_group = "eu-north-1"
  domain               = "vpc"
}

resource "aws_nat_gateway" "custom_NAT_GW" {
  allocation_id     = aws_eip.custom_EPI.allocation_id
  subnet_id         = aws_subnet.public_subnet.id
  connectivity_type = "public"

  tags = {
    Name = "custom-NAT-GW"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.custom_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.custom_NAT_GW.id
  }

  tags = {
    Name = "private_custom_RT"
  }
}

resource "aws_route_table_association" "pvt_RT_Association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

// private subnet-2

resource "aws_subnet" "private_subnet-2" {
  vpc_id            = aws_vpc.custom_VPC.id
  cidr_block        = "172.168.3.0/24"
  availability_zone = "eu-north-1c"

  tags = {
    Name = "private-subnet-2"
  }
}



resource "aws_route_table_association" "pvt_subnet2_RT_Association" {
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.private_route_table.id
}


