resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ubuntu22.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet_az1.id
  vpc_security_group_ids = [aws_security_group.bastion_security_group.id]
  iam_instance_profile   = aws_iam_instance_profile.jenkins_execution_profile.name
  root_block_device {
    volume_size = 50
  }
  user_data = templatefile("./install.sh", {})

  tags = {
    Name = var.instance_name
  }
}