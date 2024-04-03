# environment Variables
region       = "ap-southeast-2"
project_name = "3-tier-app"
environment  = "dev"

# VPC variables
vpc_cidr               = "10.0.0.0/16"
public_subnet_az1_cidr = "10.0.0.0/24"

# Security group variables
ssh_location = "124.168.245.10/32"

# EC2 variables
instance_type = "t2.large"
key_name      = "myec2key"
instance_name = "jenkins-server"