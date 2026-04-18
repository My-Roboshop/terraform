resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id] # id means ID of the security group
  tags = {
    Name = "terraform" # if we give name in tags, it will display instance/any service with that name
    Terraform = true  # to know that we have created using terraform
  }


provisioner "local-exec"{
      command = "echo ${self.private_ip} > inventory"
      on_failure = continue
    }

    provisioner "local-exec"{
      command = "echo Instance is destroyed"
      when    = destroy
    }

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }

    provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      ]
    }

    provisioner "remote-exec" {
      inline = [
        "sudo systemctl stop nginx",
        "echo 'successfully stopped nginx server' "
      ]
      when = destroy
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
    Name = "allow_all"
  }
}