#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
yum install git -y
sudo git clone https://github.com/GOUSERABBANI44/food.git /var/www/html/
#mv /home/ec2-user/ecomm/* /var/www/html/
#echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html