terraform {
  backend "s3" {
    bucket = "{{ cookiecutter.terraform_backend_bucket }}"
    key = "{{ cookiecutter.path_to_tfstate }}"
    dynamodb_table = "{{ cookiecutter.dynamo_db_table_for_locking }}"
    workspace_key_prefix = ""
  }
}

provider "aws" {
  region = "{{ cookiecutter.aws_region }}"
  assume_role {
    role_arn = var.roles[terraform.workspace]
  }
}