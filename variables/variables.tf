variable "ami_id" {
  type = string # data type
  default =  "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type = string
  default  = "t2.micro"
}

variable "ec2_tags" {
  type = map
  default  = {
    Name = "Terraform"
    Terraform = true
    Project = "RoboShop"
    Env = "Dev"
  }
}

variable "sg_name" {
  type = string
  default  = "allow_all"
  description = "Security Group name to attch to ec2_instance" #optional
}

variable "cidr" {
  type = list
  default  = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
  type = number
  default  = 0
}

variable "ingress_to_port" {
  type = number
  default  = 0
}

variable "egress_from_port" {
  type = number
  default  = 0
}

variable "egress_to_port" {
  type = number
  default  = 0
}

variable "protocol" {
  type = string
  default  = "-1"
}

