variable "region" {
  description = "aws region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "key_name" {
  description = "Name of the key-pair"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t2.micro"
}
