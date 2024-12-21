# the alias line allows you to create multiple providers in different regions
# first provider line is likely the default provider of the project
provider "aws" {
    alias = "seattle"
    region = "us-west-2"
}

#if you get rid of the alias line, the provider will DEFAULT to the specified region WITHOUT the alias
# finally, if you launch infrastructure without a provider & alias, you will have a bad time.
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

data "aws_region" "seattle" {
  provider = aws.seattle
}
data "aws_region" "virginia" {
  provider = aws.virginia
}

terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 3.0"

            # version in use at time of build = 5.80.0. use [version = "~> 3.0"] for a known good configuration
           # configuration_aliases = [ aws.provider.Seattle, aws.provider.Virginia ]
            # unsure how to use the config aliases correctly. likely have to build modules
        }
    }
}

