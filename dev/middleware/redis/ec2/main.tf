resource "aws_instance" "redis" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = data.terraform_remote_state.subnets.outputs.database_subnet

  vpc_security_group_ids = [
    data.terraform_remote_state.redis_sg.outputs.redis_sg_id
  ]

  key_name             = var.redis_key_name
  iam_instance_profile = data.terraform_remote_state.iam_global.outputs.instance_profile_name

  tags = {
    Name        = var.app_name
    Application = var.app_name
    Environment = "dev"
    CostCenter  = "OTMS-Platform"
    Owner       = "DevOps-Team"
  }
}
