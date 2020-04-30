resource "aws_iam_instance_profile" "test_profile" {    
name  = "test_profile"                         
roles = ["${aws_iam_role.test_role.name}"]
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::resourcepkgs",
                "arn:aws:s3:::resourcepkgs/*"
            ]
        }
    ]
}
EOF

}
resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.test_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}
resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}
