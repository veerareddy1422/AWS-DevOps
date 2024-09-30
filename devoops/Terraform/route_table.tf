#creating route table
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demoigw.id
  }
  tags = {
    Name = "Route to internet"
  }
}

#Associating Route table
resource "aws_route_table_association" "rt1" {
  subnet_id = aws_subnet.public_sb_1.id
  route_table_id = aws_route_table.pub-rt.id
}
#Associating Route tablea
resource "aws_route_table_association" "rt2" {
  subnet_id = aws_subnet.public_sb_2.id
  route_table_id = aws_route_table.pub-rt.id
}