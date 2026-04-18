data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

data "aws_instance" "mongodb" {
  instance_id = "ami-0220d79f3f480ecf5"  # check
}

output "mongodb_info" {
    value = data.aws_instance.mongodb.public_ip
}