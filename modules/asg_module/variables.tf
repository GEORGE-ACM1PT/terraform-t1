variable "asg_name" {
  description = "Auto scaling group name"
  default = "george-tf-asg"
}

variable "lc_name" {
  description = "Launch configuration name to use "
}

variable "private-subnets" {
  description = "private subnets id to use"
}