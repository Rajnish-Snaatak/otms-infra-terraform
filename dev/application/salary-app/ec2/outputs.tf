output "instance_id" {
  value = aws_instance.salary_api.id
}

output "private_ip" {
  value = aws_instance.salary_api.private_ip
}
