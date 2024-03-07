output "instance_arn" {
  value = aws_instance.ec2_ubuntu_instance.arn
}

output "public_instance_ip" {
  value = aws_instance.ec2_ubuntu_instance.public_ip
}

output "private_instance_ip" {
  value = aws_instance.ec2_ubuntu_instance.private_ip
}
