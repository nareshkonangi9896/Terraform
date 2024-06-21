variable "ami_id" {
    type = string
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

variable "instances" {
    type = map
    default = {
        MongodDB = "t2.micro" # MongodDB = "t3.medium"
        MySQL = "t2.micro" # MySQL = "t3.medium"
        Rabbitmq = "t2.micro"
        Redis = "t2.micro"
        Catalogue = "t2.micro"
        Cart = "t2.micro"
        User = "t2.micro"
        Shipping = "t2.micro"
        Dispatch = "t2.micro"
        Payment = "t2.micro"
        Web = "t2.micro"
    }
}
 
variable "sg_name"{
    type = string
    default = "allow-all"
}
variable "sg_cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}

