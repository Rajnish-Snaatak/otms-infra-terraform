output "asg_name" {
  value = aws_autoscaling_group.salary_api.name
}

output "asg_arn" {
  value = aws_autoscaling_group.salary_api.arn
}
