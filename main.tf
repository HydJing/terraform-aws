resource "aws_vpc" "terraform_test_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "terraform_test_subnet" {
  vpc_id                  = aws_vpc.terraform_test_vpc.id
  cidr_block              = "10.123.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public"
  }
}

resource "aws_internet_gateway" "terraform_test_internet_gateway" {
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "terraform_test_public_rt" {
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "dev-public_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.terraform_test_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terraform_test_internet_gateway.id

}

resource "aws_route_table_association" "terraform_test_public_assoc" {
  subnet_id      = aws_subnet.terraform_test_subnet.id
  route_table_id = aws_route_table.terraform_test_public_rt.id
}

resource "aws_security_group" "terraform_test_sg" {
  name        = "dev_sg"
  description = "dev security group"
  vpc_id      = aws_vpc.terraform_test_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # change to your allowed IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}