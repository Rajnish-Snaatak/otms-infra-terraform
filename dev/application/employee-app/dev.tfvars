# Employee App
app_name = "employee-app"
app_port = 8080

# VPC Terraform state
vpc_state_bucket = "dev-otms-terraform-state"
vpc_state_key    = "dev/application/employee-app/vpc.tfstate"

# ALB Terraform state
alb_state_bucket = "dev-otms-terraform-state"
alb_state_key    = "dev/application/employee-app/alb.tfstate"

# Frontend Terraform state
frontend_state_bucket = "dev-otms-terraform-state"
frontend_state_key    = "dev/application/employee-app/frontend.tfstate"
