output "scylla_instance_ids" {
  description = "IDs of the scylla EC2 instances"
  value       = aws_instance.scylla[*].id
}

output "scylla_private_ips" {
  description = "Private IPs of scylla EC2 instances"
  value       = aws_instance.scylla[*].private_ip
}
