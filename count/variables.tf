variable "instance_names"{
  type = list
  default = ["Web", "MongoDB", "Catalogue", "Cart", "MySQL", "Shipping", "Rabbitmq", "Payments", "Dispatch", "User", "Redis"]
}

variable "ami_id" {
  type    = string
  default = "ami-0b4f379183e5706b9"
}

variable "zone_id" {
type = string
default = "Z05436162VP5EXTPZDANB"  
}

variable "domain" {
type = string
default = "nareshdevops.online"  
}