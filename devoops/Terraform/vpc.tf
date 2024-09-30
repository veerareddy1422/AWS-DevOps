provider "aws" {
  region = "us-east-1"
}
#creating VPC 
resource "aws_vpc" "demovpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name="Demo VPC"
  }
}