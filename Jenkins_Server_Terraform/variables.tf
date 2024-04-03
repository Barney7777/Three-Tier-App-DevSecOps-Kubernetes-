# environment Variables

variable "region" {
  description = "region to create resources"
  type        = string
}

variable "project_name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

# VPC variables
variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "public subnet az1 cidr block"
  type        = string
}

# Security group variables
variable "ssh_location" {
  description = "ip address that can ssh into the serverr"
  type        = string
}

# EC2 variables
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 keypair"
  type        = string
}

variable "instance_name" {
  description = "EC2 Instance name for the jenkins/bastionhost server"
  type        = string
}
