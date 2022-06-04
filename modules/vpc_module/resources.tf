
# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.base_cidr_block
  tags ={
      Name = var.vpc_name
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
  cidr_block = cidrsubnet(var.base_cidr_block,4,1)

  tags = {
    Name = "george-public-1-tf"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(var.base_cidr_block,4,2)

  tags = {
    Name = "george-public-2-tf"
  }
}
resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(var.base_cidr_block,4,3)

  tags = {
    Name = "george-public-3-tf"
  }
}


resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(var.base_cidr_block,4,4)

  tags = {
    Name = "george-private-1-tf"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(var.base_cidr_block,4,5)

  tags = {
    Name = "george-private-2-tf"
  }
}
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(var.base_cidr_block,4,6)

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


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "f" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.route_table_private.id
}