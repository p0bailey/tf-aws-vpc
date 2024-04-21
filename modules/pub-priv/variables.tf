# Generated by Tofuinit
variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "MyVPC"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "nat_gateway_count" {
  description = "Number of NAT gateways to deploy, can be 1 or 3."
  type        = number
  default     = 1
}

variable "create_vpc_endpoints" {
  description = "A boolean flag to control whether VPC endpoints and related security group should be created."
  type        = bool
  default     = true
}
