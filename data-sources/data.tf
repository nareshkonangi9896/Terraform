data "aws_ami" "ami_id" {
    most_recent = true
    owners = ["amazon"]
    filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

output "ami_id" {
    value = data.aws_ami.ami_id.id
  
}

data "aws_vpc" "default" {
  default = true
} 

output "vpc_info" {
    value = data.aws_vpc.default
  
}


resource "aws_security_group" "allow_http" {
  vpc_id  = data.aws_vpc.default.id
  name        = "some-name"
  description = "Allow all ports"

  ingress {
    description      = "allow all inbound traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}