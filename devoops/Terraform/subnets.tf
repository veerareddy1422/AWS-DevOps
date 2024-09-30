resource "aws_subnet" "public_sb_1" {
    vpc_id = aws_vpc.demovpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch=true
    availability_zone = "us-east-1a"
    tags = {
      Name="web subnet1"
    }
}
resource "aws_subnet" "public_sb_2" {
    vpc_id = aws_vpc.demovpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch=true
    availability_zone = "us-east-1b"
    tags = {
      Name="web subnet2"
    }
}
resource "aws_subnet" "application_sb_1" {
    vpc_id = aws_vpc.demovpc.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch=true
    availability_zone = "us-east-1a"
    tags = {
      Name="application subnet1"
    }
}
resource "aws_subnet" "application_sb_2" {
    vpc_id = aws_vpc.demovpc.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch=true
    availability_zone = "us-east-1b"
    tags = {
      Name="application subnet2"
    }
}
resource "aws_subnet" "private_sb_1" {
    vpc_id = aws_vpc.demovpc.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch=false
    availability_zone = "us-east-1a"
    tags = {
      Name="database subnet1"
    }
}
resource "aws_subnet" "private_sb_2" {
    vpc_id = aws_vpc.demovpc.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch=false
    availability_zone = "us-east-1b"
    tags = {
      Name="database subnet2"
    }
}