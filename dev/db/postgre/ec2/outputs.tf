output "postgres_instance_ids" {
  description = "IDs of the Postgres EC2 instances"
  value       = aws_instance.postgres[*].id
}

output "postgres_private_ips" {
  description = "Private IPs of Postgres EC2 instances"
  value       = aws_instance.postgres[*].private_ip
}
