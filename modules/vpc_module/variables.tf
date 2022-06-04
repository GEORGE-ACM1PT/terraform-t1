variable "base_cidr_block" {
  description = "VPC CIDR "
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  description = "VPC name"
  default = "george-tf-vpc"
}
variable "availability_zones" {
  type = list(string)
  default = ["us-west-2a","us-west-2b","us-west-2c","us-west-2d"]
}