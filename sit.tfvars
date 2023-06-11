ec2_ami           = "ami-04f7efe62f419d9f5"
ec2_key_name      = "Thirdkey"
ec2_instance_type = "t2.micro"
default_tags = {
  "Name"        = "SIT Application Server"
  "Environment" = "SIT"
  "Can Destroy" = "No"
  "Ownner"      = "Mr. Jones"
}

bucket = "simidevops-terraform-state-files"
key = "sit/terraform.tfstate"