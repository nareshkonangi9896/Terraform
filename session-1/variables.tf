variable "ami_id" {
  type    = string
  default = "ami-0b4f379183e5706b9"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sg_name" {
  type    = string
  default = "allow_all"
}

variable "sg_cidr" {
  type    = list
  default = ["0.0.0.0/0"]
}

variable "tags"{
  type = map
  default = {
    Name = "MongoDB"
    Environment = "DEV"
    Terraform = "true"
    Project = "Roboshop"
    Component = "MongoDB"
  }
}

