resource "aws_network_acl" "frontend_nacl" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = [data.terraform_remote_state.subnets.outputs.frontend_subnet]

  # --------------------------------------------------
  # SSH from Bastion (Public Subnet 1)
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
  # ALB → Frontend (HTTP)
  # --------------------------------------------------
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = "10.0.0.0/23"
    action     = "allow"
  }

  # --------------------------------------------------
  # ALB → Frontend (HTTPS)
  # --------------------------------------------------
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = "10.0.0.0/23"
    action     = "allow"
  }

  # --------------------------------------------------
  # Ephemeral return traffic (ALB health checks & responses)
  # --------------------------------------------------
  ingress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = "10.0.0.0/23"
    action     = "allow"
  }

  # --------------------------------------------------
  # Frontend → Backend APIs
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
    Name = "frontend-nacl"
  }
}
