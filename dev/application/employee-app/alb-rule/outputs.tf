output "listener_rule_arn" {
  value = aws_lb_listener_rule.employee_api.arn
}

output "alb_sg_id" {
  value       = data.terraform_remote_state.alb.outputs.alb_sg_id
  description = "Security group ID of the ALB"
}

