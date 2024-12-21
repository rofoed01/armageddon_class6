resource "aws_ec2_transit_gateway" "seattle_tgw" {
  provider = aws.seattle
  description = "Seattle TGW"
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support = "enable"
  security_group_referencing_support = "enable"
  vpn_ecmp_support = "enable"
  transit_gateway_cidr_blocks = ["10.0.0.0/8"]
  tags = {
    Name = "Seattle TGW"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "seattle_tgw_vpc_attachment" {
  provider = aws.seattle
  subnet_ids = [aws_subnet.private-us-west-2a.id, aws_subnet.private-us-west-2b.id, aws_subnet.private-us-west-2c.id]
  transit_gateway_id = aws_ec2_transit_gateway.seattle_tgw.id
  vpc_id = aws_vpc.seattle_vpc.id
  dns_support = "enable"
  tags = {
    Name = "Seattle TGW VPC Attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table" "seattle_tgw_rt" {
  provider = aws.seattle
  transit_gateway_id = aws_ec2_transit_gateway.seattle_tgw.id
  tags = {
    Name = "Seattle TGW Route Table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "seattle_tgw_rt_association" {
  provider = aws.seattle
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.seattle_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.seattle_tgw_rt.id
  replace_existing_association = true
}

resource "aws_ec2_transit_gateway_route" "seattle_tgw_route_a" {
  provider = aws.seattle
    destination_cidr_block         = "${aws_subnet.private-us-west-2a.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.seattle_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.seattle_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "seattle_tgw_route_b" {
  provider = aws.seattle
    destination_cidr_block         = "${aws_subnet.private-us-west-2b.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.seattle_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.seattle_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "seattle_tgw_route_c" {
  provider = aws.seattle
    destination_cidr_block         = "${aws_subnet.private-us-west-2c.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.seattle_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.seattle_tgw_rt.id
}

resource "aws_ec2_transit_gateway_peering_attachment" "peer_request" {
  provider                = aws.seattle
  peer_account_id         = aws_ec2_transit_gateway.virginia_tgw.owner_id
  peer_region             = data.aws_region.virginia.name
  peer_transit_gateway_id = aws_ec2_transit_gateway.virginia_tgw.id
  transit_gateway_id      = aws_ec2_transit_gateway.seattle_tgw.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}

# route from seattle TGW to Virginia VPC
resource "aws_ec2_transit_gateway_route" "seattle_to_virginia_route_a" {
  provider = aws.seattle
    destination_cidr_block         = "${aws_subnet.private-us-east-1a.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.peer_accept.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.seattle_tgw_rt.id

  depends_on = [ aws_ec2_transit_gateway_peering_attachment_accepter.peer_accept ]
}


#################################################################################################

resource "aws_ec2_transit_gateway" "virginia_tgw" {
  provider = aws.virginia
  description = "virginia TGW"
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support = "enable"
  security_group_referencing_support = "enable"
  vpn_ecmp_support = "enable"
  transit_gateway_cidr_blocks = ["10.0.0.0/8"]
  tags = {
    Name = "virginia TGW"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "virginia_tgw_vpc_attachment" {
  provider = aws.virginia
  subnet_ids = [aws_subnet.private-us-east-1a.id, aws_subnet.private-us-east-1b.id, aws_subnet.private-us-east-1c.id]
  transit_gateway_id = aws_ec2_transit_gateway.virginia_tgw.id
  vpc_id = aws_vpc.virginia_vpc.id
  dns_support = "enable"
  tags = {
    Name = "virginia TGW VPC Attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table" "virginia_tgw_rt" {
  provider = aws.virginia
  transit_gateway_id = aws_ec2_transit_gateway.virginia_tgw.id
  tags = {
    Name = "virginia TGW Route Table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "virginia_tgw_rt_association" {
  provider = aws.virginia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.virginia_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.virginia_tgw_rt.id
  replace_existing_association = true
}

resource "aws_ec2_transit_gateway_route" "virginia_tgw_route_a" {
  provider = aws.virginia
    destination_cidr_block         = "${aws_subnet.private-us-east-1a.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.virginia_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.virginia_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "virginia_tgw_route_b" {
  provider = aws.virginia
    destination_cidr_block         = "${aws_subnet.private-us-east-1b.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.virginia_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.virginia_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "virginia_tgw_route_c" {
  provider = aws.virginia
    destination_cidr_block         = "${aws_subnet.private-us-east-1c.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.virginia_tgw_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.virginia_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "virginia_to_seattle_route_a" {
  provider = aws.virginia
    destination_cidr_block         = "${aws_subnet.private-us-west-2a.cidr_block}"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.peer_accept.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.virginia_tgw_rt.id

  depends_on = [ aws_ec2_transit_gateway_peering_attachment_accepter.peer_accept ]
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "peer_accept" {
  provider =   aws.virginia
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.peer_request.id

  tags = {
    Name = "Example cross-account attachment"
  }
}