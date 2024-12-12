output "seattle_vpc_cidr" {
  value = aws_vpc.seattle_vpc.cidr_block
  
}

output "virginia_vpc_cidr" {
  value = aws_vpc.virginia_vpc.cidr_block
  
}

output "seattle_vpc_lb_dns_name" {
  value       = "http://${aws_lb.seattle_vpc_alb.dns_name}"
  description = "The DNS name of the seattle_vpc Load Balancer."
}

output "virginia_vpc_lb_dns_name" {
  value       = "http://${aws_lb.virginia_vpc_alb.dns_name}"
  description = "The DNS name of the virginia_vpc Load Balancer."
}