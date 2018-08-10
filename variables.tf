variable "region" {
  description = "The region to apply these templates to (e.g. us-east-1)"
}

variable "aws_profile" {
  description = "Profile to use for running terraform"
}

# s3 bucket should be uniq, that's why in terraform we add account number
# terraform-state-${aws_account_id}
variable "s3_states_bucket_name" {
  default = "terraform-states"
}

variable "table_name" {
  default = "terraform_locks"
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = "map"
}
