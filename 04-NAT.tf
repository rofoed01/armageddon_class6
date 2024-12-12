resource "aws_eip" "seattle_eip" {
  provider = aws.seattle
  vpc = true

  tags = {
    Name = "seattle_eip"
  }
}

resource "aws_nat_gateway" "seattle_nat" {
  provider      = aws.seattle
  allocation_id = aws_eip.seattle_eip.id
  subnet_id     = aws_subnet.public-us-west-2a.id

  tags = {
    Name = "seattle_nat"
  }

  depends_on = [aws_internet_gateway.seattle_igw]
}

#################################################

resource "aws_eip" "virginia_eip" {
  provider = aws.virginia
  vpc = true

  tags = {
    Name = "virginia_eip"
  }
}

resource "aws_nat_gateway" "virginia_nat" {
  provider      = aws.virginia
  allocation_id = aws_eip.virginia_eip.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "virginia_nat"
  }

  depends_on = [aws_internet_gateway.virginia_igw]
}