# ------------------------
# Public Route Table
# ------------------------
resource "aws_route_table" "public_rt" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.igw.outputs.igw_id
  }

  tags = {
    Name = "Dev-Public-RT"
  }
}

# ------------------------
# Private Route Table
# ------------------------
resource "aws_route_table" "private_rt" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.terraform_remote_state.nat.outputs.nat_gateway_id
  }

  tags = {
    Name = "Dev-Private-RT"
  }
}

# ------------------------
# Public Subnet Associations
# ------------------------
resource "aws_route_table_association" "public_1" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.public_subnets[0]
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.public_subnets[1]
  route_table_id = aws_route_table.public_rt.id
}

# ------------------------
# Private Subnet Associations
# ------------------------
resource "aws_route_table_association" "frontend" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.frontend_subnet
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "backend" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.backend_subnet
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "middleware" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.middleware_subnet
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "database" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.database_subnet
  route_table_id = aws_route_table.private_rt.id
}
