resource "aws_autoscaling_group" "attendance_api" {
name = "Dev-${var.app_name}-asg"
min_size = var.min_size
max_size = var.max_size
desired_capacity = var.desired_capacity


vpc_zone_identifier = [
data.terraform_remote_state.subnets.outputs.frontend_subnet
]


launch_template {
id = data.terraform_remote_state.lt.outputs.launch_template_id
version = data.terraform_remote_state.lt.outputs.launch_template_latest_version
}


target_group_arns = [
data.terraform_remote_state.tg.outputs.target_group_arn
]


health_check_type = "ELB"
health_check_grace_period = 300


tag {
key = "Name"
value = "${var.app_name}-asg"
propagate_at_launch = true
}


tag {
key = "Application"
value = var.app_name
propagate_at_launch = true
}


tag {
key = "Environment"
value = "dev"
propagate_at_launch = true
}
}
