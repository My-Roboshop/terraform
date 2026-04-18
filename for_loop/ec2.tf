resource "aws_instance" "terraform" {
  for_each = toset(var.instances)
  ami           = "ami-0220d79f3f480ecf5"
  #instance_type = each.value
  instance_type = "t3.medium"
  vpc_security_group_ids = [aws_security_group.allow_all.id] # id means ID of the security group
  tags = {
    #Name = each.key # if we give name in tags, it will display instance/any service with that name
    Name = each.value
    Terraform = true  # to know that we have created using terraform
  }
}

resource "aws_security_group" "allow_all" {
  name   = "allow_all"
 egress {
    from_port        = 0 # from port 0 to toport 0 means we are allowing everything
    to_port          = 0
    protocol         = "-1"  # -1 means we are allowing all protocols
    cidr_blocks      = ["0.0.0.0/0"] # means allowing internet
  }

 ingress {
    from_port        = 0 # from port 0 to toport 0 means we are allowing everything
    to_port          = 0
    protocol         = "-1"  # -1 means we are allowing all protocols
    cidr_blocks      = ["0.0.0.0/0"] # means allowing internet
  }

  tags = {
    Name = "terraform"
  }
}