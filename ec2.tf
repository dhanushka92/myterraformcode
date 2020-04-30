resource "aws_instance" "appserver1"{
ami="${var.ami}"
instance_type="${var.inst_type}"
subnet_id="${aws_subnet.subnet1.id}"
vpc_security_group_ids = ["${aws_security_group.sgrp1.id}"]
iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
user_data = "${file("chrome.ps1")}"
tags = {
    name = "INSTNCE1"
 }
}


resource "aws_instance" "appserver2"{
ami="${var.ami}"
instance_type="${var.inst_type}"
subnet_id="${aws_subnet.subnet2.id}"
vpc_security_group_ids = ["${aws_security_group.sgrp1.id}"]
iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
tags = {
    name = "INSTANCE2"
  }
}


