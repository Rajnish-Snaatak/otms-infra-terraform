resource "aws_launch_template" "employee_api" {
  name_prefix   = "Dev-${var.app_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.employee_sg.outputs.sg_id
  ]

  iam_instance_profile {
    name = data.terraform_remote_state.iam_global.outputs.instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = var.app_name
      Application = var.app_name
      Environment = "dev"
      CostCenter  = "OTMS-Platform"
      Owner       = "DevOps-Team"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
