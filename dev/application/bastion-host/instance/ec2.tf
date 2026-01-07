resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id              = data.terraform_remote_state.subnets.outputs.public_subnets[0]
  vpc_security_group_ids = [
  data.terraform_remote_state.bastion_sg.outputs.bastion_sg_id
]
  associate_public_ip_address = true

  tags = merge(
    local.common_tags,
    { Name = "${var.environment}-bastion-host" }
  )
}
