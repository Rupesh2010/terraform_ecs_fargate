provider "aws" {
  region = "us-east-1"
}

locals {

  vpc = "vpc-9323d6e9"

  protected_subnets = [
    {
      id = "subnet-89ba17a7"
      cidr = "172.31.80.0/20"
      az = "us-east-1b"
    }
  ]

  machine_images = {
    amzn_ecs = "ami-5253c32d"
  }

  default_security_group_id = ""

  hosted_zone_id = ""
}
