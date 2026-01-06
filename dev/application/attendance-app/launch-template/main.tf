resource "aws_launch_template" "attendance_api" {
  name_prefix   = "${var.app_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.attendance_sg.outputs.sg_id
  ]

 iam_instance_profile {
  name = data.terraform_remote_state.iam_global.outputs.instance_profile_name
 }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.app_name}-instance"
      Application = var.app_name
      Environment = "dev"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
