provider "aws" {
  version = "~> 1.24"
  region  = "${var.region}"
  profile = "${var.aws_profile}"
}
