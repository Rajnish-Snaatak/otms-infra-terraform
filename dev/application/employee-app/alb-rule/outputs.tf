output "listener_rule_arn" {
  value = aws_lb_listener_rule.employee_api.arn
}
output "alb_sg_id" {
  value = aws_security_group.employee_alb_sg.id
  description = "Security group ID of the ALB"
}
