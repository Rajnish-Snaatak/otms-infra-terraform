# ==========================================
# Security Group for SSM VPC Endpoints
# ==========================================
resource "aws_security_group" "ssm_endpoints_sg" {
  name   = "dev-ssm-endpoints-sg"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

 ingress {
   from_port       = 443
   to_port         = 443
   protocol        = "tcp"
 security_groups = [
      data.terraform_remote_state.db.outputs.postgres_sg_id,
      data.terraform_remote_state.salary_sg.outputs.sg_id
    ]
 }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev-ssm-endpoints-sg"
  }
}

# ==========================================
# SSM Endpoint
# ==========================================
resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  # ONLY ONE private subnet (all are in same AZ)
  subnet_ids = [
    data.terraform_remote_state.subnets.outputs.backend_subnet
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoints_sg.id
  ]
}

# ==========================================
# EC2 Messages Endpoint
# ==========================================
resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    data.terraform_remote_state.subnets.outputs.backend_subnet
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoints_sg.id
  ]
}

# ==========================================
# SSM Messages Endpoint
# ==========================================
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.ssmmessages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    data.terraform_remote_state.subnets.outputs.backend_subnet
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoints_sg.id
  ]
}
