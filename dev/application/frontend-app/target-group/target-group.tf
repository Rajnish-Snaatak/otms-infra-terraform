resource "aws_lb_target_group" "frontend_tg" {
  name     = "${var.environment}-${var.application}-tg"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = data.terraform_remote_state.network.outputs.vpc_id

  health_check {
    path                = var.health_check_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.application}-tg"
    }
  )
}
