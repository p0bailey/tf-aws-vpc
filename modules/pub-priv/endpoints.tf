

locals {
  private_route_table_ids = aws_route_table.private.*.id
}

#  Security groups for VPC Endpoints
resource "aws_security_group" "vpc_endpoint" {
  count  = var.create_vpc_endpoints ? 1 : 0 # Use the renamed variable for conditional creation
  name   = "${var.vpc_name}-vpce-sg"
  vpc_id = aws_vpc.main.id # Ensure you have this VPC defined elsewhere in your code

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block] # Ensure aws_vpc.main is correctly defined
  }

  tags = {
    Name = var.vpc_name
  }
}

# VPC Endpoint for S3
resource "aws_vpc_endpoint" "s3" {
  count             = var.create_vpc_endpoints ? 1 : 0
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = local.private_route_table_ids # Direct assignment without additional brackets
  tags = {
    Name = var.vpc_name
  }
}


# VPC Endpoint for Docker Registry API (ECR API)
resource "aws_vpc_endpoint" "dkr_api" {
  count               = var.create_vpc_endpoints ? 1 : 0
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_endpoint[0].id]
  subnet_ids          = aws_subnet.private.*.id
  tags = {
    Name = var.vpc_name
  }
}

# VPC Endpoint for CloudWatch Logs
resource "aws_vpc_endpoint" "logs" {
  count               = var.create_vpc_endpoints ? 1 : 0
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.logs"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_endpoint[0].id]
  subnet_ids          = aws_subnet.private.*.id
  tags = {
    Name = var.vpc_name
  }
}

# VPC Endpoint for AWS Secrets Manager
resource "aws_vpc_endpoint" "secretsmanager" {
  count               = var.create_vpc_endpoints ? 1 : 0
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.secretsmanager"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_endpoint[0].id]
  subnet_ids          = aws_subnet.private.*.id
  tags = {
    Name = var.vpc_name
  }
}

# VPC Endpoint for AWS Systems Manager (SSM)
resource "aws_vpc_endpoint" "ssm" {
  count               = var.create_vpc_endpoints ? 1 : 0
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_endpoint[0].id]
  subnet_ids          = aws_subnet.private.*.id
  tags = {
    Name = var.vpc_name
  }
}

# VPC Endpoint for AWS Key Management Service (KMS)
resource "aws_vpc_endpoint" "kms" {
  count               = var.create_vpc_endpoints ? 1 : 0
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.kms"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_endpoint[0].id]
  subnet_ids          = aws_subnet.private.*.id
  tags = {
    Name = var.vpc_name
  }
}
