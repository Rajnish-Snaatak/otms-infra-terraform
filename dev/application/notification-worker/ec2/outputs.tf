output "instance_id" {
  value = aws_instance.notification_worker.id
}

output "private_ip" {
  value = aws_instance.notification_worker.private_ip
}
