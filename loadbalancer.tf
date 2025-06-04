resource "aws_lb" "ecs-lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]
  depends_on         = [aws_ecs_task_definition.ecs_task_definition]

  enable_deletion_protection = false

}

# aws_lb_target_group
resource "aws_lb_target_group" "ecs-http" {
  name     = "${var.alb_name}-http-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    protocol            = "HTTP"
    path                = "/health"
    matcher             = "200-299"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

}

# aws_lb_listener
resource "aws_lb_listener" "ecs-http" {
  load_balancer_arn = aws_lb.ecs-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-http.arn
  }
}


