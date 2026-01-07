output "launch_template_id" {
  description = "Launch template ID for employee API"
  value       = aws_launch_template.employee_api.id
}

output "launch_template_latest_version" {
  description = "Latest version of employee API launch template"
  value       = aws_launch_template.employee_api.latest_version
}
