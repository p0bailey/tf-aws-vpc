# AWS VPC Modules

## Overview

This repository contains Terraform modules for deploying Virtual Private Cloud (VPC) environments on AWS. These modules are designed to simplify the creation and management of VPCs, subnets, NAT gateways, and related networking resources.

## Features

- **Customizable VPC Creation:** Configure the VPC with multiple subnet configurations.


## Prerequisites

- AWS Account
- Terraform 0.12+

## Usage

To use these modules, include them in your Terraform configurations like this:

```hcl
module "vpc" {
    source   = "github.com/p0bailey/tf-aws-vpc/modules/pub-priv"
}
```