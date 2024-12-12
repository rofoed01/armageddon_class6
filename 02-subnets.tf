#These are  for  public

resource "aws_subnet" "public-us-west-2a" {
  provider                = aws.seattle
  vpc_id                  = aws_vpc.seattle_vpc.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-2a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-us-west-2b" {
  provider                = aws.seattle
  vpc_id                  = aws_vpc.seattle_vpc.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-2b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#these are for private
resource "aws_subnet" "private-us-west-2a" {
  provider          = aws.seattle
  vpc_id            = aws_vpc.seattle_vpc.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name    = "private-us-west-2a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-us-west-2b" {
  provider          = aws.seattle
  vpc_id            = aws_vpc.seattle_vpc.id
  cidr_block        = "10.10.12.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name    = "private-us-west-2b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "private-us-west-2c" {
  provider          = aws.seattle
  vpc_id            = aws_vpc.seattle_vpc.id
  cidr_block        = "10.10.13.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name    = "private-us-west-2c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#################################################

#These are   for  public

resource "aws_subnet" "public-us-east-1a" {
  provider                = aws.virginia
  vpc_id                  = aws_vpc.virginia_vpc.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  provider                = aws.virginia
  vpc_id                  = aws_vpc.virginia_vpc.id
  cidr_block              = "10.20.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#these are for private
resource "aws_subnet" "private-us-east-1a" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.20.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  provider          = aws.virginia  
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.20.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "private-us-east-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "private-us-east-1c" {
  provider          = aws.virginia  
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.20.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name    = "private-us-east-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}