resource "aws_autoscaling_policy" "frontend_cpu_target" {
  name = "${var.environment}-${var.application}-cpu-target-policy"

  autoscaling_group_name = data.terraform_remote_state.asg.outputs.asg_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.cpu_target_value
  }
}
