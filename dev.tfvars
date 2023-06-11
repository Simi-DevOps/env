ec2_ami           = "ami-04f7efe62f419d9f5"
ec2_key_name      = "Thirdkey"
ec2_instance_type = "t2.micro"
default_tags = {
  "Name"        = "Development Application Server"
  "Environment" = "Dev"
  "Can Destroy" = "Yes"
  "Ownner"      = "Mark Finch"
}

bucket = "simidevops-terraform-state-files"
key = "dev/terraform.tfstate"

