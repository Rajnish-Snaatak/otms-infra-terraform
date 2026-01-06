output "launch_template_id" {
  value = aws_launch_template.salary_api.id
}

output "launch_template_latest_version" {
  value = aws_launch_template.salary_api.latest_version
}
