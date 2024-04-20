# AWS Private Public VPC with Terraform

This Terraform configuration is designed to provision a fully functional AWS Virtual Private Cloud (VPC) environment, complete with public and private subnets, Internet and NAT gateways, and route tables for effective traffic management. The setup is ideal for deploying scalable and secure cloud applications.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- Terraform v1.0 or later
- AWS CLI v2.x
- An AWS account with the necessary permissions to create the resources outlined in this configuration

## Configuration Details

This Terraform setup includes the following components:

- **VPC**: A Virtual Private Cloud configured with a CIDR block.
- **Internet Gateway**: For providing access to the Internet from the VPC.
- **Subnets**:
  - **Public Subnets**: Three public subnets without automatic public IP assignment.
  - **Private Subnets**: Three private subnets for secure resource allocation.
- **NAT Gateways**: Configured in the public subnet to allow outbound Internet access for instances in the private subnets.
- **Elastic IPs**: Assigned to each NAT Gateway.
- **Route Tables**: Separate route tables for public and private subnets with appropriate routing rules.
- **Variables**: Customizable options for region, VPC name, CIDR block, and the number of NAT gateways.

## Usage

To deploy this infrastructure:

1. **Configure AWS CLI**:
   ```bash
   aws configure
   ```
   Set your AWS access key, secret key, and the default region.

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```
   This command initializes a Terraform working directory by downloading necessary plugins.

3. **Plan the Deployment**:
   ```bash
   terraform plan
   ```
   Review the plan to see the resources that will be created.

4. **Apply the Configuration**:
   ```bash
   terraform apply
   ```
   Confirm the action to provision the specified AWS resources.

## Outputs

The configuration will generate the following outputs after successful deployment:

- `vpc_id`: The ID of the created VPC.
- `private_subnet_ids`: The IDs of the created private subnets.
- `public_subnet_ids`: The IDs of the created public subnets.

## Customization

You can modify the default values in the `variables.tf` file to fit your specific requirements, such as changing the VPC name, CIDR block, or the number of NAT gateways.

## Cleanup

To remove the deployed resources:

```bash
terraform destroy
```

Confirm the action to delete all resources managed by the Terraform configuration.

## Default Variables

This configuration uses several variables with default values to allow for easy customization. Here are the default values provided:

- **region**: Specifies the AWS region where resources will be created. Default is `"us-east-1"`.
- **vpc_name**: The name assigned to the VPC. Default is `"MyVPC"`.
- **vpc_cidr**: The CIDR block for the VPC. Default is `"10.0.0.0/16"`.
- **nat_gateway_count**: Determines the number of NAT gateways to deploy. Can be either 1 or 3, with a default of 1.

You can adjust these variables in the `terraform.tfvars` file or pass them directly via the command line to tailor the deployment to your needs.