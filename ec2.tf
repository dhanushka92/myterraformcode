
resource "aws_instance" "pubserver1"{
ami="${var.ami}"
instance_type="${var.inst_type}"
subnet_id="${aws_subnet.public-sub.id}"
key_name="dhanu1"
associate_public_ip_address = "true"
    }


resource "aws_instance" "appserver1"{
ami="${var.ami}"
instance_type="${var.inst_type}"
subnet_id="${aws_subnet.subnet1.id}"
vpc_security_group_ids = ["${aws_security_group.sgrp1.id}"]
iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
provisioner "local-exec" {
    command = <<EOH
curl https://resourcepkgs.s3.amazonaws.com/ChromeSetup.exe
EOH
key_name="dhanu1"
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
key_name="dhanu1"
user_data     = <<EOF
<powershell>

</powershell>
EOF
tags = {
    name = "INSTANCE2"
  }
}


