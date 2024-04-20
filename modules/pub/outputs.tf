# Generated by Tofuinit

output "vpc_id" {
  description = "The ID of the VPC created"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets created"
  value       = aws_subnet.public.*.id
}
