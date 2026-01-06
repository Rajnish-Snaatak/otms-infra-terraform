resource "aws_route53_record" "alb_root" {
  zone_id = data.terraform_remote_state.dns.outputs.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.alb.outputs.alb_dns_name
    zone_id                = data.terraform_remote_state.alb.outputs.alb_zone_id
    evaluate_target_health = true
  }
}
