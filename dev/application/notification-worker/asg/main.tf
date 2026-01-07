provider "aws" {
  region = var.aws_region
}

resource "aws_autoscaling_group" "notification_worker" {
  name = "${var.application}-${var.environment}-asg"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  vpc_zone_identifier = [
    data.terraform_remote_state.subnets.outputs.backend_subnet
  ]

  launch_template {
    id      = data.terraform_remote_state.lt.outputs.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.application}-${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Application"
    value               = var.application
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = var.owner
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "CostCenter"
    value               = var.cost_center
    propagate_at_launch = true
  }
}
