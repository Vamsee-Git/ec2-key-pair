variable "ami" {
  description = "The AMI to use for the instance"
  type = string
  default = "ami-084568db4383264d4" 
}

variable "instance_type" {
  description = "The instance type to use"
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type = string
}

variable "security_group_id" {
  description = "The security group ID to associate with the instance"
  type = string
}

variable "key_name" {
  description = "The security group ID to associate with the instance"
  type = string
}
