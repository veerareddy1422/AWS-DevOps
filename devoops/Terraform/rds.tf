resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [ aws_subnet.private_sb_1.id , aws_subnet.private_sb_2.id ]
  tags = {
    name = "mydbsubnetgrop"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage = 10
  db_subnet_group_name = aws_db_subnet_group.default.name
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  multi_az = true
  #Name = "mydatabase"
  username = "admin"
  password = "password"
  vpc_security_group_ids = [aws_security_group.databasesecurity.id]
  skip_final_snapshot = true
  publicly_accessible = false
  tags = {
    Name = "Mydb"
  }
}