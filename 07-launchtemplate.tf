resource "aws_launch_template" "seattle_LT_80" {
  provider      = aws.seattle
  name_prefix   = "seattle_LT_80"
  image_id      = "ami-055e3d4f0bbeb5878"  
  instance_type = "t2.micro"

#  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.seattle_vpc-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for Seattle port 80 app</title>
    </head>
    <body>
    <div>
    <h1>Starbucks Sages</h1>
    <h1>Sleepless in Seattle</h1>

    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "seattle_LT"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}




# resource "aws_launch_template" "seattle_LT_443" {
#   name_prefix   = "seattle_LT_443"
#   image_id      = "ami-055e3d4f0bbeb5878"  
#   instance_type = "t2.micro"

#   key_name = "MyLinuxBox"

#   vpc_security_group_ids = [aws_security_group.seattle_vpc-sg03-secure-servers.id]

#   user_data = base64encode(<<-EOF
#     #!/bin/bash
#     yum update -y
#     yum install -y httpd
#     systemctl start httpd
#     systemctl enable httpd

#     # Get the IMDSv2 token
#     TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

#     # Background the curl requests
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
#     wait

#     macid=$(cat /tmp/macid)
#     local_ipv4=$(cat /tmp/local_ipv4)
#     az=$(cat /tmp/az)
#     vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

#     # Create HTML file
#     cat <<-HTML > /var/www/html/index.html
#     <!doctype html>
#     <html lang="en" class="h-100">
#     <head>
#     <title>Details for Seattle port 443 app</title>
#     </head>
#     <body>
#     <div>
#     <h1>Starbucks Sages</h1>
#     <h1>Sleepless and secure in Seattle</h1>
#     <h2>Sleepless and secure...an asylum...we're headed to Arkham!</h2>
#     <p><b>Instance Name:</b> $(hostname -f) </p>
#     <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
#     <p><b>Availability Zone: </b> $az</p>
#     <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
#     </div>
#     </body>
#     </html>
#     HTML

#     # Clean up the temp files
#     rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
#   EOF
#   )

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name    = "seattle_LT_443"
#       Service = "application1"
#       Owner   = "Chewbacca"
#       Planet  = "Mustafar"
#     }
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }


############################################################################################################

resource "aws_launch_template" "virginia_LT_80" {
  provider      = aws.virginia
  name_prefix   = "virginia_LT_80"
  image_id      = "ami-0453ec754f44f9a4a"  
  instance_type = "t2.micro"

#  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.virginia_vpc-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for Virginia port 80 app</title>
    </head>
    <body>
    <div>
    <h1>Valiant Vanguards</h1>
    <h1>Vigilant in Virginia</h1>

    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "virginia_LT_80"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}




# resource "aws_launch_template" "virginia_LT_443" {
#   name_prefix   = "virginia_LT_443"
#   image_id      = "ami-0453ec754f44f9a4a"  
#   instance_type = "t2.micro"

#   key_name = "MyLinuxBox"

#   vpc_security_group_ids = [aws_security_group.virginia_vpc-sg03-secure-servers.id]

#   user_data = base64encode(<<-EOF
#     #!/bin/bash
#     yum update -y
#     yum install -y httpd
#     systemctl start httpd
#     systemctl enable httpd

#     # Get the IMDSv2 token
#     TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

#     # Background the curl requests
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
#     wait

#     macid=$(cat /tmp/macid)
#     local_ipv4=$(cat /tmp/local_ipv4)
#     az=$(cat /tmp/az)
#     vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

#     # Create HTML file
#     cat <<-HTML > /var/www/html/index.html
#     <!doctype html>
#     <html lang="en" class="h-100">
#     <head>
#     <title>Details for Virginia port 443 app</title>
#     </head>
#     <body>
#     <div>
#     <h1>Valiant Vanguards</h1>
#     <h1>Vigilant and vaulted in Virginia</h1>
#     <h2>Vigilant and vaulted...more secure than the Pentagon airspace!</h2>
#     <p><b>Instance Name:</b> $(hostname -f) </p>
#     <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
#     <p><b>Availability Zone: </b> $az</p>
#     <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
#     </div>
#     </body>
#     </html>
#     HTML

#     # Clean up the temp files
#     rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
#   EOF
#   )

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name    = "virginia_LT_443"
#       Service = "application1"
#       Owner   = "Chewbacca"
#       Planet  = "Mustafar"
#     }
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }