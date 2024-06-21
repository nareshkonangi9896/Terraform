resource "aws_vpc" "Roboshop" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
    Env = "Dev"
    terraform = "true"
  }
}

resource "aws_subnet" "Roboshop-public" {
  vpc_id     = aws_vpc.Roboshop.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Roboshop-public"
  }
}

resource "aws_subnet" "Roboshop-private" {
  vpc_id     = aws_vpc.Roboshop.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Roboshop-private"
  }
}
resource "aws_internet_gateway" "Roboshop-gw" {
  vpc_id = aws_vpc.Roboshop.id

  tags = {
    Name = "Roboshop-gw"
  }
}

resource "aws_route_table" "roboshop-public" {
  vpc_id = aws_vpc.Roboshop.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Roboshop-gw.id
  }
  tags = {
    Name = "roboshop-public"
  }
}

resource "aws_route_table" "roboshop-private" {
  vpc_id = aws_vpc.Roboshop.id
  tags = {
    Name = "roboshop-private"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.Roboshop-public.id
  route_table_id = aws_route_table.roboshop-public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.Roboshop-private.id
  route_table_id = aws_route_table.roboshop-private.id
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Roboshop.id

  ingress {
    description      = "HTTPS from Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "SSH from laptop"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["49.43.225.243/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "allow_ssh_http"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Roboshop-public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  associate_public_ip_address = true
  tags = {
    Name = "web"
  }
}



