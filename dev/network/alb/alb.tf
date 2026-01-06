resource "aws_lb" "alb" {
  name               = "dev-alb"
  internal           = false
  load_balancer_type = "application"

  subnets = data.terraform_remote_state.subnets.outputs.public_subnets

  security_groups = [aws_security_group.alb_sg.id]
}

# HTTP → HTTPS redirect
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# HTTPS listener (root domain cert)
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = data.terraform_remote_state.acm.outputs.certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "ALB HTTPS is running"
      status_code  = "200"
    }
  }
}
