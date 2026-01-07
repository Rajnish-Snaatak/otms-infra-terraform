output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.dev_vpc.cidr_block
}
