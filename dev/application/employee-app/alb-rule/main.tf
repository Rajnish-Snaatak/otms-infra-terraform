resource "aws_lb_listener_rule" "employee_api" {
  listener_arn = data.terraform_remote_state.alb.outputs.alb_https_listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.target_group.outputs.target_group_arn
  }

  condition {
    path_pattern {
      values = [var.path_pattern]
    }
  }
}
