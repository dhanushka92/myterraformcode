/*resource "aws_db_subnet_group" "demo_subntgrp"{
name="demo_subntgrp"
subnet_ids=["${aws_subnet.subnet3.id}","${aws_subnet.subnet4.id}"]
}

resource "aws_db_instance" "sqldb"{
allocated_storage=20
storage_type="gp2"
engine="${var.eng}"
engine_version="${var.sqlver}"
instance_class="${var.inst_class}"
username="${var.dbusername}"
password="${var.pswrd}"
db_subnet_group_name="${aws_db_subnet_group.demo_subntgrp.id}"
vpc_security_group_ids = ["${aws_security_group.sgrp1.id}"]
multi_az="false"
tags = {
    name = "RDS"
}
}*/
