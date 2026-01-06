resource "aws_instance" "notification_worker" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.terraform_remote_state.subnets.outputs.middleware_subnet

  vpc_security_group_ids = [
    data.terraform_remote_state.notification_sg.outputs.notification_worker_sg_id
  ]

  key_name = var.key_name

  tags = {
    Name        = "${var.app_name}-ec2"
    Application = var.app_name
    Environment = "dev"
  }
}
