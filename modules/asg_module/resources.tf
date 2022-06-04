resource "aws_autoscaling_group" "as_conf" {
  name                      = var.asg_name
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = var.lc_name
  vpc_zone_identifier       = var.private-subnets
  lifecycle {
    create_before_destroy = true
  }
}