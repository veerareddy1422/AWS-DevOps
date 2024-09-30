#Creating 2nd EC2 instance
resource "aws_instance" "instance-secound" {
  ami = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
  key_name = "devops"
  subnet_id = aws_subnet.public_sb_1.id
  vpc_security_group_ids = [aws_security_group.security1.id]
  associate_public_ip_address = true
  user_data = file("data1.sh") 

tags = {
    Name = "public_instance-2"
}
}