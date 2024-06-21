resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "Allow all ports"

  ingress {
    description      = "allow all inbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr
  }

}