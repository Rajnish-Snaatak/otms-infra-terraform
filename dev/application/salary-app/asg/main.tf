resource "aws_autoscaling_group" "salary_api" {
  name = "Dev-${var.app_name}-asg"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  vpc_zone_identifier = [
    data.terraform_remote_state.subnets.outputs.backend_subnet
  ]

  target_group_arns = [
    data.terraform_remote_state.target_group.outputs.target_group_arn
  ]

  launch_template {
    id      = data.terraform_remote_state.launch_template.outputs.launch_template_id
    version = data.terraform_remote_state.launch_template.outputs.launch_template_latest_version
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300

  
  tag {
    key                 = "Name"
    value               = "${var.app_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Application"
    value               = var.app_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "dev"
    propagate_at_launch = true
  }

  tag {
    key                 = "CostCenter"
    value               = "OTMS-Platform"
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = "DevOps-Team"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
