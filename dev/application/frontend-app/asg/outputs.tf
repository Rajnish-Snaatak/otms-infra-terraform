output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.frontend_asg.name
}
