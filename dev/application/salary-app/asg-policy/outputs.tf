output "scaling_policy_name" {
  value = aws_autoscaling_policy.cpu_target_tracking.name
}

output "scaling_policy_arn" {
  value = aws_autoscaling_policy.cpu_target_tracking.arn
}

