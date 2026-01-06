resource "aws_instance" "attendance_api" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.terraform_remote_state.subnets.outputs.backend_subnet
  vpc_security_group_ids = [
    data.terraform_remote_state.attendance_sg.outputs.sg_id
  ]
  key_name = var.key_name

  tags = {
    Name        = "${var.app_name}-ec2"
    Application = var.app_name
    Environment = "dev"
  }
}
