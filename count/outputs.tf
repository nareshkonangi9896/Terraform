output "private_ip" {
    value = aws_instance.count[*].private_ip
}