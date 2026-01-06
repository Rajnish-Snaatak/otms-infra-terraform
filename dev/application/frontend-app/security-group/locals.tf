locals {
  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
    CostCenter  = var.cost_center
  }
}
