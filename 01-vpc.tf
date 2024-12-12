resource aws_vpc "seattle_vpc" {
  cidr_block = "10.10.0.0/16"
  provider = aws.seattle # this builds the VPC in seattle region

  tags = {
    Name = "seattle_VPC"
    Service = "vpc"
    Owner = "Maximo"
    Planet = "Eritrea"
  }
}

resource aws_vpc "virginia_vpc" {
  cidr_block = "10.20.0.0/16"
  provider = aws.virginia
  
  tags = {
    Name = "virginia_VPC"
    Service = "vpc"
    Owner = "jacquelyn"
    Planet = "chorra"
  }
}