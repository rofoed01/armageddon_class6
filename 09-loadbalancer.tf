resource "aws_lb" "seattle_vpc_alb" {
  provider           = aws.seattle
  name               = "seattle-vpc-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.seattle_vpc-sg02-LB01.id]
  subnets            = [
    aws_subnet.public-us-west-2a.id,
    aws_subnet.public-us-west-2b.id,
    #aws_subnet.public-us-west-2c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "seattle_vpc_LB01"
    Service = "Multiapp"
    Owner   = "Chewbacca"
    Project = "Multiapp"
  }
}

resource "aws_lb_listener" "seattle_vpc_alb_http" {
  load_balancer_arn = aws_lb.seattle_vpc_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.seattle_vpc_tg_80.arn
  }
}

# data "aws_acm_certificate" "cert" {
#   domain   = "balericaclass6.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.seattle_vpc_alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.seattle_vpc_tg_443.arn
#   }
# }

##########################################################

resource "aws_lb" "virginia_vpc_alb" {
  provider           = aws.virginia
  name               = "virginia-vpc-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.virginia_vpc-sg02-LB01.id]
  subnets            = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id,
    #aws_subnet.public-us-east-1c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "virginia_vpc_LB01"
    Service = "Multiapp"
    Owner   = "Chewbacca"
    Project = "Multiapp"
  }
}

resource "aws_lb_listener" "virginia_vpc_alb_http" {
  provider          = aws.virginia
  load_balancer_arn = aws_lb.virginia_vpc_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.virginia_vpc_tg_80.arn
  }
}

# data "aws_acm_certificate" "cert" {
#   domain   = "balericaclass6.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.virginia_vpc_alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.virginia_vpc_tg_443.arn
#   }
# }