output "instance_id" {
  value = aws_instance.attendance_api.id
}

output "private_ip" {
  value = aws_instance.attendance_api.private_ip
}
