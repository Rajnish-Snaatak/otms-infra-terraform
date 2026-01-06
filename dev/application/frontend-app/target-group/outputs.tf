output "frontend_tg_arn" {
  description = "Frontend Target Group ARN"
  value       = aws_lb_target_group.frontend_tg.arn
}
