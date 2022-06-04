variable "base_cidr_block" {
  description = "VPC CIDR "
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  description = "VPC name"
  default = "george-tf-vpc"
}