resource "aws_lb_target_group" "salary_api" {
  name        = "${var.app_name}-tg"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    Name        = "${var.app_name}-tg"
    Application = var.app_name
    Environment = "dev"
  }
}
