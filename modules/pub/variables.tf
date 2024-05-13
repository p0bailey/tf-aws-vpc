# Generated by Tofuinit
variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS profile used"
  type        = string
  default     = "null"
}


variable "vpc_name" {
  description = "The vpc name"
  type        = string
  default     = "MyVpc"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_newbits" {
  description = "The number of additional bits with which to extend the VPC CIDR for subnetting."
  type        = number
  default     = 24 # For example, a /24 for each subnet if VPC is /16
}

variable "subnet_count" {
  description = "The number of subnets to create."
  type        = number
  default     = 3
}
