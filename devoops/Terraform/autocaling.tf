resource "aws_launch_template" "web_lanuch_templete" {
  name_prefix = "web-lanuuch-templete"
  image_id = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = [aws_security_group.security1.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
        Name = "webinstance"
    }
  }
}
resource "aws_autoscaling_group" "web-asg" {
  desired_capacity = 2
  max_size = 5
  min_size = 1
  launch_template {
    id = aws_launch_template.web_lanuch_templete.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.public_sb_1.id,aws_subnet.public_sb_2.id]
  health_check_type = "EC2"
  health_check_grace_period = 300
  tag {
    key = "Name"
    value = "Webservernstace"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_attachment" "asg-attachements" {
  autoscaling_group_name = aws_autoscaling_group.web-asg.name
  lb_target_group_arn = aws_lb_target_group.target_lb.arn
}