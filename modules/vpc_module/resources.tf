
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

resource "aws_subnet" "public" {
  count       = length(var.availability_zones)
  vpc_id      = aws_vpc.example.id
  availability_zone = var.availability_zones[count.index]
  cidr_block   = cidrsubnet(var.base_cidr_block,4,count.index+1)
  tags = {
    Name = "george-public-${count.index}-tf"
  }
}

resource "aws_subnet" "private" {
  count = length(var.availability_zones)
  vpc_id     = aws_vpc.example.id
  availability_zone = var.availability_zones[count.index]
  cidr_block = cidrsubnet(var.base_cidr_block,4,count.index+length(var.availability_zones)+1)
  tags = {
    Name = "george-private-${count.index}-tf"
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

resource "aws_route_table_association" "public" {
  count = length(var.availability_zones)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.availability_zones)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.route_table_private.id
}