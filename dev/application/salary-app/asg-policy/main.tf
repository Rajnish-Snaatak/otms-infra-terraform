resource "aws_autoscaling_policy" "cpu_target_tracking" {
  name                   = "salary-api-cpu-scaling-policy"
  autoscaling_group_name = data.terraform_remote_state.asg.outputs.asg_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_cpu_utilization
  }
}
