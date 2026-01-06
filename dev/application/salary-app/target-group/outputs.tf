output "target_group_arn" {
  value = aws_lb_target_group.salary_api.arn
}

output "target_group_name" {
  value = aws_lb_target_group.salary_api.name
}
