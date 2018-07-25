terraform-aws-init
==================

Initial project which resolves chicken&egg problem. Before starting using
terraform we need to have some initial infrastructure:

* to store terraform states;
* to work with locks;

This project creates initial infrastructure for further terraformation.

By default it'll create two resources:

* s3 bucket with name: `terraform-states-HERE_WILL_BE_YOUR_ACC_ID`
* dynamodb locktable with name: `terraform_locks`

How-to-run
----------

```bash
terraform apply -auto-approve=false -var aws_profile=your_aws_profile -var region=us-east-1
```

How-to use results in other terraform projects
----------------------------------------------

Projects that runs terraform can now use the below definition for storing states
and using locks:

```
terraform {
  backend "s3" {
    bucket         = "terraform-states-HERE_WILL_BE_YOUR_ACC_ID"
    key            = "PROJECT_NAME/REGION/terraform/terraform.tfstate"
    region         = "REGION"
    acl            = "bucket-owner-full-control"
    dynamodb_table = "terraform_locks"
  }
}
```

where:
  - REGION is aws region, e.g. us-east-1
  - PROJECT_NAME is your project name, eg. openshift_cluster_dev_1

Example:

```bash
terraform {
  backend "s3" {
    bucket         = "terraform-states-xxxxxxxxx"
    key            = "os_cluster_dev1/us-east-1/terraform/terraform.tfstate"
    region         = "us-east-1"
    acl            = "bucket-owner-full-control"
    dynamodb_table = "terraform_locks"
  }
}
```
