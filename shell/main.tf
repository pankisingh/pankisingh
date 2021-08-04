module "sg" {
  source = "./sg"
}

module "ec2" {
  depends_on = [module.sg]
  source  = "./ec2"
  SG_ID   = module.sg.SG_ID
  //AMI = "ami-074df373d6bafa625"
  TYPE = "t3.small"
}

provider "aws" {
  region = "us-east-1"
}

output "PRIVATE_IP" {
  value = module.ec2.PRIVATE_IP
}
