resource "aws_network_acl" "public_nacl" {
  vpc_id =  data.terraform_remote_state.vpc.outputs.vpc_id

  subnet_ids = data.terraform_remote_state.subnets.outputs.public_subnets

  # SSH (Bastion)
  ingress {
    rule_no    = 50
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidr_block = var.ssh_allowed_cidr
    action     = "allow"
  }

  # HTTP
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  # HTTPS
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  # Ephemeral return traffic
  ingress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  # Egress (FIXED)
  egress {
    rule_no    = 100
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  tags = {
    Name = "public-nacl"
  }
}
