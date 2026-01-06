resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = data.terraform_remote_state.subnets.outputs.public_subnets[0]

  tags = {
    Name = "Dev-NAT-Gateway"
  }

  depends_on = [
    data.terraform_remote_state.igw
  ]
}
