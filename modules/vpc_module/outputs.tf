output "vpc_id" {
    value = aws_vpc.example.id
}

output "private-subnets" {
  value = [ aws_subnet.private1.id, aws_subnet.private2.id, aws_subnet.private3.id]
}