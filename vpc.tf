data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc"  "sample_vpc"{
cidr_block="${var.vpc_cidr}"
tags = {
    name = "myVPC"
  }
}
resource "aws_subnet" "public-sub"{
cidr_block="10.0.0.0/26"
vpc_id="${aws_vpc.main.id}"
availability_zone="us-east-1a"
}

resource "aws_internet_gateway" "igw"{
vpc_id="${aws_vpc.main.id}"
}

resource "aws_route_table" "rtbl"{
vpc_id="${aws_vpc.main.id}"
route{
cidr_block="0.0.0.0/0"
gateway_id="${aws_internet_gateway.igw.id}"
}
}

resource "aws_route_table_association" "pubrtbl"{
subnet_id="${aws_subnet.public-sub.id}"
route_table_id="${aws_route_table.rtbl.id}"
}
resource "aws_subnet" "subnet1"{
vpc_id="${aws_vpc.sample_vpc.id}"
cidr_block="${var.prvt_subnet1_cidr}"
availability_zone="${data.aws_availability_zones.available.names[0]}"
tags = {
    name = "SUBNET1"
  }
}

resource "aws_subnet" "subnet2"{
vpc_id="${aws_vpc.sample_vpc.id}"
cidr_block="${var.prvt_subnet2_cidr}"
availability_zone="${data.aws_availability_zones.available.names[1]}"
tags = {
    name = "SUBNET2"
  }
}

resource "aws_subnet" "subnet3"{
vpc_id="${aws_vpc.sample_vpc.id}"
cidr_block="${var.prvt_subnet3_cidr}"
availability_zone="${data.aws_availability_zones.available.names[0]}"
tags = {
    name = "SUBNET3"
  }
}

resource "aws_subnet" "subnet4"{
vpc_id="${aws_vpc.sample_vpc.id}"
cidr_block="${var.prvt_subnet4_cidr}"
availability_zone="${data.aws_availability_zones.available.names[1]}"
tags = {
    name = "SUBNET4"
  }
}

resource "aws_security_group" "sgrp1"{
name="sgrp1"
vpc_id="${aws_vpc.sample_vpc.id}"
 ingress{
 from_port=3389
 to_port=3389
 protocol="tcp"
 cidr_blocks=["0.0.0.0/0"]
}
tags = {
    name = "SECURITYGRP1"
}
}




