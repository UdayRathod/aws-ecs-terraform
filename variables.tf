variable "aws_region" {
  type        = string
  description = "AWS region to use for resources."
  default     = "us-west-2"
}

variable "vpc_cidr" {
  type        = string
  description = "AWS vpc CIDR for resources."
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-west-1a,us-west-1b-us-west-1c"]
}

variable "alb_name" {
  type        = string
  description = "Name for ALB."
  default     = "aws-ecs-front-facing-alb"
}