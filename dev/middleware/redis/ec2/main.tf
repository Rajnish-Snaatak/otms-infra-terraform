resource "aws_instance" "redis" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = data.terraform_remote_state.subnets.outputs.middleware_subnet

  vpc_security_group_ids = [
    data.terraform_remote_state.redis_sg.outputs.redis_sg_id
  ]

  key_name = var.key_name

  tags = {
    Name        = "redis-ec2-dev"
    Component   = "middleware"
    Service     = "redis"
    Environment = "dev"
  }
}
