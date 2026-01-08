output "redis_instance_ids" {
  value = aws_instance.redis[*].id
}

output "redis_private_ips" {
  value = aws_instance.redis[*].private_ip
}

