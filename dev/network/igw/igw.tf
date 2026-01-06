resource "aws_internet_gateway" "igw" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "Dev-IGW"
  }
}
