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