output "asg_name" {
  value = aws_autoscaling_group.employee_api.name
}

output "asg_arn" {
  value = aws_autoscaling_group.employee_api.arn
}
