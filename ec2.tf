resource "aws_instance" "appserver1"{
ami="${var.ami}"
instance_type="${var.inst_type}"
subnet_id="${aws_subnet.subnet1.id}"
vpc_security_group_ids = ["${aws_security_group.sgrp1.id}"]
tags = {
    name = "INSTNCE1"
 }
}


resource "aws_instance" "appserver2"{
ami="${var.ami}"
instance_type="${var.inst_type}"
subnet_id="${aws_subnet.subnet2.id}"
vpc_security_group_ids = ["${aws_security_group.sgrp1.id}"]
tags = {
    name = "INSTANCE2"
  }
}


