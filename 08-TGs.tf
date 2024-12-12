resource "aws_lb_target_group" "seattle_vpc_tg_80" {
  provider = aws.seattle
  name     = "seattle-vpc-tg-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.seattle_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "seattle_vpcTargetGroup_80"
    Service = "seattle_vpc"
    Owner   = "Chewbacca"
    Project = "seattle_vpc"
  }
}

# resource "aws_lb_target_group" "seattle_vpc_tg_443" {
#   provider = aws.seattle
#   name     = "seattle-vpc-tg-443"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.seattle_vpc.id
#   target_type = "instance"

#   health_check {
#     enabled             = true
#     interval            = 30
#     path                = "/"
#     protocol            = "HTTP"
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#     timeout             = 5
#     matcher             = "200"
#   }

#   tags = {
#     Name    = "seattle_vpc_tg_443"
#     Service = "seattle_vpc"
#     Owner   = "Chewbacca"
#     Project = "App2"
#   }
# }


############################################

resource "aws_lb_target_group" "virginia_vpc_tg_80" {
  provider = aws.virginia
  name     = "virginia-vpc-tg-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.virginia_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "virginia_vpc_tg_80"
    Service = "virginia_vpc"
    Owner   = "Chewbacca"
    Project = "virginia_vpc"
  }
}

# resource "aws_lb_target_group" "virginia_vpc_tg_443" {
#   provider = aws.virginia
#   name     = "virginia-vpc-tg-443"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.virginia_vpc.id
#   target_type = "instance"

#   health_check {
#     enabled             = true
#     interval            = 30
#     path                = "/"
#     protocol            = "HTTP"
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#     timeout             = 5
#     matcher             = "200"
#   }

#   tags = {
#     Name    = "virginia_vpc_tg_443"
#     Service = "App2"
#     Owner   = "Chewbacca"
#     Project = "App2"
#   }
# }