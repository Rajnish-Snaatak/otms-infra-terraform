resource "aws_lb_listener_rule" "frontend_rule" {
  listener_arn = data.terraform_remote_state.alb.outputs.alb_https_listener_arn
  priority     = var.listener_priority

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.target_group.outputs.frontend_tg_arn
  }

  condition {
    path_pattern {
      values = var.path_patterns
    }
  }
}
