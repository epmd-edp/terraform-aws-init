output "s3-states-bucket-name" {
  value = "${aws_s3_bucket.terraform-state-storage-s3.id}"
}

output "dynamodb-lock-table" {
  value = "${aws_dynamodb_table.tf-locktable.id}"
}

output "rhel7_4-available-ami-nodes" {
  value = "${data.aws_ami.rhel7_4.id}"
}

output "centos7_4-available-ami-nodes" {
  value = "${data.aws_ami.centos7.id}"
}

output "amazonlinux-available-ami-bastion" {
  value = "${data.aws_ami.amazonlinux.id}"
}
