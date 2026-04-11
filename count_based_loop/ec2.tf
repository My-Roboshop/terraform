resource "aws_instance" "terraform" {
  count = 4
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id] # id means ID of the security group
  tags = {
    Name = var.instances[count.index]
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