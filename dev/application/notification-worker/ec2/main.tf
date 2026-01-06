provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "notification_worker" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = data.terraform_remote_state.subnets.outputs.backend_subnet

  key_name = var.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  tags = {
    Name        = "${var.application}-${var.environment}-dev"
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
    CostCenter  = var.cost_center
  }
}
