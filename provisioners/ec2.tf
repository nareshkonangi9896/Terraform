resource "aws_instance" "provisioner"{
    ami           = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
}
}
resource "aws_instance" "remote" {
    ami           = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
    security_groups = ["sg-00f993a8661c80daf"]
    subnet_id = "subnet-03cf363ef06bc5bd1"
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
}