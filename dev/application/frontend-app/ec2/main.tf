resource "aws_instance" "frontend" {
  ami                         = "ami-03cc4e5014964f57f"
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_group_id]

  associate_public_ip_address = false   # <--- important, disables public IP

  tags = {
    Name        = "frontend-app-ec2"
    Application = "frontend-app"
    Environment = "dev"
  }
}
