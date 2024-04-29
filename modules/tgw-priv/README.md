# AWS Private Public VPC with Terraform

This repository contains Terraform code for setting up a comprehensive VPC infrastructure on AWS, designed to support both public and private subnet configurations. This environment is suitable for deploying scalable and secure cloud applications that require complex networking configurations, such as separate subnets for front-end and back-end services, NAT gateways for secure internet access, and multiple route tables.

## Prerequisites

Before you begin, you will need the following:

- Terraform v1.0 or higher
- AWS CLI v2.x
- An AWS account with adequate permissions to create the resources described

## Configuration Details

The Terraform scripts configure the following resources:

- **VPC**: Creates a VPC to provide the network environment for your resources.
- **Internet Gateway**: Connects the VPC to the internet, facilitating communication with external networks.
- **Subnets**:
  - **Public Subnets**: Configures three public subnets, designed to host resources that need to be directly accessible from the internet.
  - **Private Subnets**: Establishes three private subnets for resources that should not be directly accessible from the outside world.
- **NAT Gateways**: Placed in the public subnet to enable instances in the private subnets to connect out to the internet securely.
- **Elastic IPs**: Provides stable IP addresses for the NAT gateways.
- **Route Tables**: Implements separate routing logic for public and private subnets, ensuring correct traffic flow.
- **VPC Endpoints**: Creates secure endpoints for AWS services like S3 and ECR, reducing exposure to public internet.
- **Security Groups**: Defines firewall rules to control inbound and outbound traffic to the instances.

