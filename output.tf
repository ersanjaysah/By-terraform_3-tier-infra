output "vpc-id" {
  value = aws_vpc.custom_VPC.id
}

output "igw-id" {
  value = aws_internet_gateway.custom_IGW.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "route_table_id" {
  value = aws_route_table.custom_route_table.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "epi_Allocation_ID" {
  value = aws_eip.custom_EPI.allocation_id
}

output "nat_GW_ID" {
  value = aws_nat_gateway.custom_NAT_GW.id
}

output "pvt_rT_id" {
  value = aws_route_table.private_route_table.id
}

output "private-subnet2_ID" {
  value = aws_subnet.private_subnet-2.id
}

output "private-subnet2-RT-association" {
  value = aws_route_table_association.pvt_subnet2_RT_Association.id
}

output "nginx-sg_ID" {
  value = aws_security_group.nginx_SG.id
}

output "pvt-subnet1-sg-ID" {
  value = aws_security_group.pvt_subnet1_SG.id
}

output "nginx-instance-ID" {
  value = aws_instance.web_server1.id
}

output "app-server-ID" {
  value = aws_instance.app_server1.id
}

output "db-sg-gp-ID" {
  value = aws_security_group.DB_server_SG.id
}

output "db-server-instance-ID" {
  value = aws_instance.db_server.id
}

