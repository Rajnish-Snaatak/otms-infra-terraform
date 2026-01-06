output "alb_record_fqdn" {
  value = aws_route53_record.alb_root.fqdn
}
