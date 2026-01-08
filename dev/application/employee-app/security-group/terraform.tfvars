# Employee App name
app_name = "employee-api"

# Port for the Employee App
app_port = 8080

# VPC Terraform state info
vpc_state_bucket = "dev-otms-terraform-state"
vpc_state_key    = "dev/network/vpc/terraform.tfstate"

# ALB Terraform state info
alb_state_bucket = "dev-otms-terraform-state"
alb_state_key    = "dev/application/employee-api/alb-rule/terraform.tfstate"

# Frontend Terraform state info (fixed path)
frontend_state_bucket = "dev-otms-terraform-state"
frontend_state_key    = "dev/application/frontend/security-group/terraform.tfstate"
