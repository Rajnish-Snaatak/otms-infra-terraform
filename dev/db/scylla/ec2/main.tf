resource "aws_instance" "scylla" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.database.id

  vpc_security_group_ids = [
    data.terraform_remote_state.scylla_sg.outputs.scylla_sg_id
  ]

  key_name = var.key_name

  iam_instance_profile = data.terraform_remote_state.iam_global.outputs.instance_profile_name

  tags = {
    Name        = var.app_name
    Application = var.app_name
    Environment = "dev"
    CostCenter  = "OTMS-Platform"
    Owner       = "DevOps-Team"
  }
}

