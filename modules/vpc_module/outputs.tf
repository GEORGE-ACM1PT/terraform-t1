output "vpc_id" {
    value = aws_vpc.example.id
}

output "private-subnets" {
  value = aws_subnet.private.*.id
}