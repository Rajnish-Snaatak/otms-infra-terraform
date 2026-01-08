resource "aws_network_acl" "middleware_nacl" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = [
    data.terraform_remote_state.subnets.outputs.middleware_subnet
  ]

  # --------------------------------------------------
  # SSH from Bastion (optional, for break-glass)
  # --------------------------------------------------
  ingress {
    rule_no    = 50
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidr_block = "10.0.0.0/24"
    action     = "allow"
  }

  # --------------------------------------------------
  # Backend → Redis
  # --------------------------------------------------
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 6379
    to_port    = 6379
    cidr_block = "10.0.8.0/22"
    action     = "allow"
  }

  # --------------------------------------------------
  # Ephemeral ports (SSM + backend responses)
  # --------------------------------------------------
  ingress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = data.terraform_remote_state.vpc.outputs.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Middleware → SSM VPC Endpoints (HTTPS)
  # --------------------------------------------------
  egress {
    rule_no    = 60
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = data.terraform_remote_state.vpc.outputs.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Middleware → Backend responses
  # --------------------------------------------------
  egress {
    rule_no    = 100
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "10.0.8.0/22"
    action     = "allow"
  }

  # --------------------------------------------------
  # SSH response back to Bastion
  # --------------------------------------------------
  egress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = "10.0.0.0/24"
    action     = "allow"
  }

  tags = {
    Name = "middleware-nacl"
  }
}
