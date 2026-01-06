output "alb_zone_id" {
  value = aws_lb.alb.zone_id
}

output "alb_arn" {
  value = aws_lb.alb.arn
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "alb_http_listener_arn" {
  value = aws_lb_listener.http.arn
}

output "alb_https_listener_arn" {
  value = aws_lb_listener.https.arn
}
