output "target_group_arn" {
value = aws_lb_target_group.attendance_api.arn
}


output "target_group_name" {
value = aws_lb_target_group.attendance_api.name
}
