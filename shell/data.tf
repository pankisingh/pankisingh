data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "^Centos*"
  owners           = ["973714476881"]
}

data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.micro"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "amis" {
  value = data.aws_ami.example.id
}

output "spot" {
  value = data.aws_ec2_spot_price.example
}

provider "aws" {
  region = "us-east-1"
}
