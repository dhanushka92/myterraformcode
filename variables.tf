variable "vpc_cidr"{
default="10.0.0.0/24"
}

variable "inst_type"{
default="t2.micro"
}

variable "inst_class"{
default="db.t2.micro"
}

variable "eng"{
default="sqlserver-ex"
}

variable "sqlver"{
default="14.00.3223.3.v1"
}


variable "prvt_subnet1_cidr"{
default="10.0.1.0/24"
}

variable "prvt_subnet2_cidr"{
default="10.0.2.0/24"
}

variable "prvt_subnet3_cidr"{
default="10.0.3.0/24"
}

variable "prvt_subnet4_cidr"{
default="10.0.4.0/24"
}


variable "ami"{
default="ami-08bf5f54919fada4a"
}

variable "dbusername"{
default="rose"
}

variable "pswrd"{
default="lavender1"
}
