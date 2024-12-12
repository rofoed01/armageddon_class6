resource "aws_security_group" "seattle_vpc-sg01-servers" {
  name        = "seattle_vpc-sg01-servers"
  description = "seattle_vpc-sg01-servers"
  vpc_id      = aws_vpc.seattle_vpc.id
  provider    = aws.seattle

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Syslog"
    from_port   = 514
    to_port     = 514
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "seattle_vpc-sg01-servers"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}





resource "aws_security_group" "seattle_vpc-sg02-LB01" {
  name        = "seattle_vpc-sg02-LB01"
  description = "seattle_vpc-sg02-LB01"
  vpc_id      = aws_vpc.seattle_vpc.id
  provider    = aws.seattle

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "seattle_vpc-sg02-LB01"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}


# resource "aws_security_group" "seattle_vpc-sg03-secure-servers" {
#   name        = "seattle_vpc-sg03-secure-servers"
#   description = "seattle_vpc-sg03-secure-servers"
#   vpc_id      = aws_vpc.seattle_vpc.id

#   ingress {
#     description = "MyHomePage"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#     ingress {
#     description = "secureIngress"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name    = "seattle_vpc-sg03-secure-servers"
#     Service = "application1"
#     Owner   = "Luke"
#     Planet  = "Musafar"
#   }

# }

#########################################################

resource "aws_security_group" "virginia_vpc-sg01-servers" {
  name        = "virginia_vpc-sg01-servers"
  description = "virginia_vpc-sg01-servers"
  vpc_id      = aws_vpc.virginia_vpc.id
  provider    = aws.virginia

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Syslog"
    from_port   = 514
    to_port     = 514
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "virginia_vpc-sg01-servers"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}





resource "aws_security_group" "virginia_vpc-sg02-LB01" {
  name        = "virginia_vpc-sg02-LB01"
  description = "virginia_vpc-sg02-LB01"
  vpc_id      = aws_vpc.virginia_vpc.id
  provider    = aws.virginia

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "virginia_vpc-sg02-LB01"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}

# resource "aws_security_group" "virginia_vpc-sg03-secure-servers" {
#   name        = "virginia_vpc-sg03-secure-servers"
#   description = "virginia_vpc-sg03-secure-servers"
#   vpc_id      = aws_vpc.virginia_vpc.id

#   ingress {
#     description = "MyHomePage"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#     ingress {
#     description = "secureIngress"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name    = "virginia_vpc-sg03-secure-servers"
#     Service = "application1"
#     Owner   = "Luke"
#     Planet  = "Musafar"
#   }

# }