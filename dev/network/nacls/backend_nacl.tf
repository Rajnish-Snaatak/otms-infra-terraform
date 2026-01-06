resource "aws_network_acl" "backend_nacl" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = [data.terraform_remote_state.subnets.outputs.backend_subnet]

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
  # Frontend → Backend (Notification / Flask on 5000)
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
  # Ephemeral ports (return traffic to frontend)
  # --------------------------------------------------
  ingress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = "10.0.14.0/23"
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
  # SSH response traffic back to Bastion
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
