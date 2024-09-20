terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
  
}
# create vpc with CIDR block
resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = "vpc1"
    }


}

# create subnet
resource "aws_subnet" "sub1" {
    cidr_block = "20.0.2.0/24"
    vpc_id = aws_vpc.vpc1.id
availability_zone = var.az1a
    tags = {
      Name = "pub-sub"
    }
  
}

resource "aws_subnet" "sub2" {
    cidr_block = "20.0.3.0/24"
    vpc_id = aws_vpc.vpc1.id
availability_zone = var.az1b
    tags = {
      Name = "pri-sub"
    }
  
}
# create IGW
resource "aws_internet_gateway" "igw1" {
    vpc_id = aws_vpc.vpc1.id

    tags = {
        Name = "igw1"
    }
  
}
# create route table
resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id


  }
  tags = {Name ="rt-pub"}
}
# associate subnet with route table
resource "aws_route_table_association" "pub-rt-association" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.rt-pub.id

}