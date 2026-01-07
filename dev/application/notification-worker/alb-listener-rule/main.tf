provider "aws" {
  region = var.aws_region
}

resource "aws_lb_listener_rule" "notification_worker" {
  listener_arn = data.terraform_remote_state.alb.outputs.alb_http_listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.tg.outputs.notification_worker_tg_arn
  }

  condition {
    path_pattern {
      values = [var.path_pattern]
    }
  }
}
