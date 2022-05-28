terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags ={
      Name ="george-vpc-tf"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "george-ig-tf"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "george-public-1-tf"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "george-public-2-tf"
  }
}
resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "george-public-3-tf"
  }
}


resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "george-private-1-tf"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "george-private-2-tf"
  }
}
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "george-private-3-tf"
  }
}


resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "george-public-route-table-tf"
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "george-private-route-table-tf"
  }
}