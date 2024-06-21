locals {
    ami_id = "ami-0b4f379183e5706b9"
    key_file = file("${path.module}/devops.pub")
    instance_type = var.isPROD == true ? "t3.medium" : "t2.micro"
}