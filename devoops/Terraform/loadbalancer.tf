resource "aws_lb" "external-lb" {
  name = "external-lb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.security1.id]
  subnets = [aws_subnet.public_sb_1.id,aws_subnet.public_sb_2.id]
  idle_timeout = 60
}
resource "aws_lb_target_group" "target_lb" {
  name = "ALB-TG"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.demovpc.id
}
resource "aws_lb_target_group_attachment" "attachement1" {
  target_group_arn = aws_lb_target_group.target_lb.arn
  target_id = aws_instance.instance-first.id
  port = 80
  depends_on = [ aws_instance.instance-first ]
}
resource "aws_lb_target_group_attachment" "attachement2" {
  target_group_arn = aws_lb_target_group.target_lb.arn
  target_id = aws_instance.instance-secound.id
  port = 80
  depends_on = [ aws_instance.instance-secound ]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-lb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_lb.arn
  }
}