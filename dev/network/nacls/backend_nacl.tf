resource "aws_network_acl" "backend_nacl" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = [
    data.terraform_remote_state.subnets.outputs.backend_subnet
  ]

  # --------------------------------------------------
  # SSH from Bastion (Public Subnet)
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
  # SSM / Internal HTTPS (from VPC)  ✅ ADD
  # --------------------------------------------------
  ingress {
    rule_no    = 60
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = data.terraform_remote_state.vpc.outputs.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Frontend → Backend APIs (8080–8084)
  # --------------------------------------------------
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 8080
    to_port    = 8084
    cidr_block = "10.0.14.0/23"
    action     = "allow"
  }

  # --------------------------------------------------
  # Frontend → Backend (Flask / Notifications 5000)
  # --------------------------------------------------
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    from_port  = 5000
    to_port    = 5000
    cidr_block = "10.0.14.0/23"
    action     = "allow"
  }

  # --------------------------------------------------
  # Ephemeral inbound (return traffic)  ✅ UPDATED
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
  # Backend → SSM Endpoint (HTTPS)  ✅ ADD
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
  # Backend → SSM Endpoint (ephemeral return)  ✅ ADD
  # --------------------------------------------------
  egress {
    rule_no    = 70
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = data.terraform_remote_state.vpc.outputs.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Backend → Middleware (Redis)
  # --------------------------------------------------
  egress {
    rule_no    = 100
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "10.0.12.0/23"
    action     = "allow"
  }

  # --------------------------------------------------
  # Backend → Database (Postgres + Scylla)
  # --------------------------------------------------
  egress {
    rule_no    = 110
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "10.0.16.0/25"
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
    Name = "backend-nacl"
  }
}
