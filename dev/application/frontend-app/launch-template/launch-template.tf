resource "aws_launch_template" "frontend_lt" {
  name_prefix   = "${var.environment}-${var.application}-lt-"
  image_id      = data.aws_ami.frontend.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.frontend_sg_id
  ]

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.environment}-${var.application}"
      }
    )
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.application}-lt"
    }
  )
}
