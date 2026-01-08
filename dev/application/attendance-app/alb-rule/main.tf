resource "aws_lb_listener_rule" "attendance_api" {
  listener_arn = data.terraform_remote_state.alb.outputs.alb_https_listener_arn
  priority     = var.priority

  condition {
    path_pattern {
      values = [var.path_pattern]
    }
  }

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.target_group.outputs.target_group_arn
  }
}

