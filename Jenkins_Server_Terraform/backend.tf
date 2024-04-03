terraform {
  backend "s3" {
    # don't use variables here, just use values
    bucket         = "barney-terraform-remote-state"
    key            = "Jenkins/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "jenkins-terraform-state-lock"
  }
}