resource "aws_autoscaling_policy" "attendance_cpu_policy" {
name = "Dev-${var.app_name}-cpu-policy"
autoscaling_group_name = data.terraform_remote_state.asg.outputs.asg_name
policy_type = "TargetTrackingScaling"


target_tracking_configuration {
predefined_metric_specification {
predefined_metric_type = "ASGAverageCPUUtilization"
}


target_value = 60
scale_in_cooldown = 300
scale_out_cooldown = 300
}
}
