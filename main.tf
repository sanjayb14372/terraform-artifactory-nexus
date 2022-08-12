# provider "aws" {
#   region = "ap-southeast-1"
# }

resource "aws_instance" "Nexus" {
  ami           = "ami-0c802847a7dd848c0"
  key_name = "demo_linux"
  instance_type = "t2.large"
  user_data     = file("nexus.sh")
  security_groups= [ "security_Group1"]
  count = 1
  tags= {
    Name = "Nexus_mircodegree"
  }
}


resource "aws_security_group" "security_Group1" {
  tags = {
    type = "terraform-test-security-group"
  }
}
