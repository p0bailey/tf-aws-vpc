
# Terraform AWS Public VPC Configuration

This Terraform module provisions a Public VPC along with associated networking resources in AWS.

## Resources Created

- **AWS VPC**: A Virtual Private Cloud to provide a logically isolated section of the AWS cloud where you can launch AWS resources.
- **Internet Gateway**: An Internet Gateway to allow communication between the VPC and the internet.
- **Public Subnets**: Configurable number of public subnets within the VPC.
- **Route Tables**: A route table containing a set of rules, called routes, that determine where network traffic from the subnets is directed.
- **Route Table Associations**: Associates subnets with the route table to route traffic according to the rules defined in the route table.

## Outputs

- **vpc_id**: The ID of the VPC created.
- **public_subnet_ids**: The IDs of the public subnets created.

## Variables

- **region**: The AWS region to create resources in. Default is `us-east-1`.
- **vpc_name**: The name of the VPC. Default is `MyVpc`.
- **vpc_cidr**: The CIDR block for the VPC. Default is `10.0.0.0/16`.
- **subnet_newbits**: The number of additional bits with which to extend the VPC CIDR for subnetting. Default is 8 (e.g., /24 for each subnet if VPC is /16).
- **subnet_count**: The number of subnets to create. Default is 3.

## Usage

To use this module in your Terraform environment, configure the required providers and variables, then run the standard Terraform commands:

```hcl
module "vpc" {
  source   = "./modules/pub" // Adjust the path as needed
  vpc_name = "MyVpc"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
```

```hcl
terraform init
terraform plan
terraform apply
```
