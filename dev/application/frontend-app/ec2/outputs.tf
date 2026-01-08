output "frontend_instance_id" {
  value       = aws_instance.frontend.id
  description = "The ID of the frontend EC2 instance"
}

#output "frontend_instance_public_ip" {
#  value       = aws_instance.frontend.public_ip
#  description = "The public IP of the frontend EC2 instance"
#}
