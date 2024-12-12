resource "aws_route_table" "seattle_rtb_private" {
  provider = aws.seattle
  vpc_id = aws_vpc.seattle_vpc.id

  route {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.seattle_nat.id
    #   carrier_gateway_id         = ""
    #   destination_prefix_list_id = ""
    #   egress_only_gateway_id     = ""
    #   gateway_id                 = ""
    #   instance_id                = ""
    #   ipv6_cidr_block            = ""
    #   local_gateway_id           = ""
    #   network_interface_id       = ""
    #   transit_gateway_id         = ""
    #   vpc_endpoint_id            = ""
    #   vpc_peering_connection_id  = ""
    }
  

  tags = {
    Name = "seattle_rtb_private"
  }
}

resource "aws_route_table" "seattle_rtb_public" {
  provider = aws.seattle
  vpc_id = aws_vpc.seattle_vpc.id

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.seattle_igw.id
    #   nat_gateway_id             = ""
    #   carrier_gateway_id         = ""
    #   destination_prefix_list_id = ""
    #   egress_only_gateway_id     = ""
    #   instance_id                = ""
    #   ipv6_cidr_block            = ""
    #   local_gateway_id           = ""
    #   network_interface_id       = ""
    #   transit_gateway_id         = ""
    #   vpc_endpoint_id            = ""
    #   vpc_peering_connection_id  = ""
    }

  tags = {
    Name = "seattle_rtb_public"
  }
}

resource "aws_route_table_association" "private-us-west-2a" {
  provider = aws.seattle
  subnet_id      = aws_subnet.private-us-west-2a.id
  route_table_id = aws_route_table.seattle_rtb_private.id
}

resource "aws_route_table_association" "private-us-west-2b" {
  provider = aws.seattle
  subnet_id      = aws_subnet.private-us-west-2b.id
  route_table_id = aws_route_table.seattle_rtb_private.id
}
resource "aws_route_table_association" "private-us-west-2c" {
  provider = aws.seattle
  subnet_id      = aws_subnet.private-us-west-2c.id
  route_table_id = aws_route_table.seattle_rtb_private.id
}


#public

resource "aws_route_table_association" "public-us-west-2a" {
  provider       = aws.seattle
  subnet_id      = aws_subnet.public-us-west-2a.id
  route_table_id = aws_route_table.seattle_rtb_public.id
}

resource "aws_route_table_association" "public-us-west-2b" {
  provider       = aws.seattle
  subnet_id      = aws_subnet.public-us-west-2b.id
  route_table_id = aws_route_table.seattle_rtb_public.id
}

# resource "aws_route_table_association" "public-us-west-2c" {
#   subnet_id      = aws_subnet.public-us-west-2c.id
#   route_table_id = aws_route_table.seattle_rtb_public.id
# }


##############################################################

resource "aws_route_table" "virginia_rtb_private" {
  provider = aws.virginia
  vpc_id = aws_vpc.virginia_vpc.id

  route {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.virginia_nat.id
    #   carrier_gateway_id         = ""
    #   destination_prefix_list_id = ""
    #   egress_only_gateway_id     = ""
    #   gateway_id                 = ""
    #   instance_id                = ""
    #   ipv6_cidr_block            = ""
    #   local_gateway_id           = ""
    #   network_interface_id       = ""
    #   transit_gateway_id         = ""
    #   vpc_endpoint_id            = ""
    #   vpc_peering_connection_id  = ""
    }

  tags = {
    Name = "virginia_rtb_private"
  }
}

resource "aws_route_table" "virginia_rtb_public" {
  provider = aws.virginia
  vpc_id = aws_vpc.virginia_vpc.id

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.virginia_igw.id
    #   nat_gateway_id             = ""
    #   carrier_gateway_id         = ""
    #   destination_prefix_list_id = ""
    #   egress_only_gateway_id     = ""
    #   instance_id                = ""
    #   ipv6_cidr_block            = ""
    #   local_gateway_id           = ""
    #   network_interface_id       = ""
    #   transit_gateway_id         = ""
    #   vpc_endpoint_id            = ""
    #   vpc_peering_connection_id  = ""
    }

  tags = {
    Name = "virginia_rtb_public"
  }
}

resource "aws_route_table_association" "private-us-east-1a" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.virginia_rtb_private.id
}

resource "aws_route_table_association" "private-us-east-1b" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.virginia_rtb_private.id
}
resource "aws_route_table_association" "private-us-east-1c" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.private-us-east-1c.id
  route_table_id = aws_route_table.virginia_rtb_private.id
}


#public

resource "aws_route_table_association" "public-us-east-1a" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.virginia_rtb_public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.virginia_rtb_public.id
}

# resource "aws_route_table_association" "public-us-east-1c" {
#   subnet_id      = aws_subnet.public-us-east-1c.id
#   route_table_id = aws_route_table.virginia_rtb_public.id
# }