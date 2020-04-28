resource "aws_vpc" "myvpc" {
  cidr_block="10.0.0.0/16"
}
resource "aws_instance" "server1"{
ami="ami-08bf5f54919fada4a"
instance_type="t2.micro"
}
