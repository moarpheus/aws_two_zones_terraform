#############################################################################
# VARIABLES
#############################################################################

variable "region_1" {
  type    = string
  default = "eu-east-1"
}

variable "region_2" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_cidr_range_east" {
  type    = string
  default = "10.10.0.0/16"
}

variable "public_subnets_east" {
  type    = list(string)
  default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "database_subnets_east" {
  type = list(string)
  default = ["10.10.8.0/24", "10.10.9.0/24"]
}

variable "vpc_cidr_range_west" {
  type    = string
  default = "10.11.0.0/16"
}

variable "public_subnets_west" {
  type    = list(string)
  default = ["10.11.0.0/24", "10.11.1.0/24"]
}

variable "database_subnets_west" {
  type = list(string)
  default = ["10.11.8.0/24", "10.11.9.0/24"]
}

#############################################################################
# PROVIDERS
#############################################################################

provider "aws" {
  version = "~> 3.0"
  region  = var.region_1
  alias = "east"
}

provider "aws" {
  version = "~> 3.0"
  region  = var.region_2
  alias = "west"
}

#############################################################################
# DATA SOURCES
#############################################################################

data "aws_availability_zones" "azs_east" {
    provider = aws.east
}

data "aws_availability_zones" "azs_west" {
    provider = aws.west
}
