output "ec2_public_ip" {
  description = "Public Ip address of the ec2 instance"
  value       = aws_instance.ec2.public_ip
}