resource "aws_autoscaling_group" "frontend_asg" {
  name = "${var.environment}-${var.application}-asg"

  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size

  vpc_zone_identifier = [
    data.terraform_remote_state.network.outputs.frontend_subnet
  ]

  target_group_arns         = [data.terraform_remote_state.tg.outputs.frontend_tg_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = data.terraform_remote_state.lt.outputs.launch_template_id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
      instance_warmup        = 300
    }
  }

  tag {
    key                 = "Name"
    value               = "${var.environment}-${var.application}"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = local.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
