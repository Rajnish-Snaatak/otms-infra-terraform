provider "aws" {
  region = var.aws_region
}

resource "aws_launch_template" "notification_worker" {
  name_prefix   = "${var.application}-${var.environment}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.notification_worker_sg_id
  ]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.application}-${var.environment}"
      Application = var.application
      Owner       = var.owner
      Environment = var.environment
      CostCenter  = var.cost_center
    }
  }
}
