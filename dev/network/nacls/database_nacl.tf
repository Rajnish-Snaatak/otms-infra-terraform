resource "aws_network_acl" "database_nacl" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = [
    data.terraform_remote_state.subnets.outputs.database_subnet
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
  # SSM Endpoint → Database (HTTPS)
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
  # PostgreSQL from Backend
  # --------------------------------------------------
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 5432
    to_port    = 5432
    cidr_block = "10.0.8.0/22"
    action     = "allow"
  }

  # --------------------------------------------------
  # ScyllaDB from Backend
  # --------------------------------------------------
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    from_port  = 9042
    to_port    = 9042
    cidr_block = "10.0.8.0/22"
    action     = "allow"
  }

  # --------------------------------------------------
  # Ephemeral return traffic (responses)
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
  # Database → SSM Endpoint (HTTPS)
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
  # Database → SSM Endpoint (ephemeral return traffic) ✅ FIX
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
  # Database → Backend responses
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
    Name = "database-nacl"
  }
}
