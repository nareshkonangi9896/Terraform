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


variable "ingress" {
    type = list
    default = [
        {
            description      = "Allowing port 443"
            from_port        = 443
            to_port          = 443
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allowing port 80"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allowing port 22"
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }
    ]
}
