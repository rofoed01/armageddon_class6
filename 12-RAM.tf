# resource "aws_ram_resource_share" "share_seattle_tgw" {
#   provider = aws.seattle
#   name = "share_seattle_tgw"
#   allow_external_principals = false
#   tags = {
#     Name = "share_seattle_tgw"
#   }
# }

# resource "aws_ram_resource_association" "share_seattle" {
#   provider = aws.seattle
#   resource_share_arn = aws_ram_resource_share.share_seattle_tgw.arn
#   resource_arn = aws_ec2_transit_gateway.seattle_tgw.arn

#   depends_on = [ aws_ec2_transit_gateway.seattle_tgw ]
# }
# resource "aws_ram_principal_association" "ram_principal_seattle" {
#   provider = aws.seattle
#   resource_share_arn = aws_ram_resource_share.share_seattle_tgw.arn
#   principal = "insert your account number here"

#   depends_on = [ aws_ec2_transit_gateway.seattle_tgw ]
# }

# ###########################################################################

# resource "aws_ram_resource_share" "share_virginia_tgw" {
#   provider = aws.virginia
#   name = "share_virginia_tgw"
#   allow_external_principals = false
#   tags = {
#     Name = "share_virginia_tgw"
#   }
# }

# resource "aws_ram_resource_association" "share_virginia" {
#   provider = aws.virginia
#   resource_share_arn = aws_ram_resource_share.share_virginia_tgw.arn
#   resource_arn = aws_ec2_transit_gateway.virginia_tgw.arn

#   depends_on = [ aws_ec2_transit_gateway.virginia_tgw ]
# }
# resource "aws_ram_principal_association" "ram_principal_virginia" {
#   provider = aws.virginia
#   resource_share_arn = aws_ram_resource_share.share_virginia_tgw.arn
#   principal = "insert your account number here"

#   depends_on = [ aws_ec2_transit_gateway.virginia_tgw ]
# }