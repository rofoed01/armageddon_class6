resource "aws_internet_gateway" "seattle_igw" {
  vpc_id = aws_vpc.seattle_vpc.id
  provider = aws.seattle

  tags = {
    Name    = "seattle_IGW"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

##########################################

resource "aws_internet_gateway" "virginia_igw" {
  vpc_id = aws_vpc.virginia_vpc.id
  provider = aws.virginia

  tags = {
    Name    = "virginia_IGW"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}