variable "capacity_provider_strategy_base" {
  description = "Capacity provider strategy base for AWS Fargate"
  default = 1
}

variable "capacity_provider_strategy_weight" {
  description = "Capacity provider strategy weight for AWS Fargate"
  default =  100
}

variable "roles" {
  description = "Role ARNs for Terraform to assume to deploy to different AWS accounts"
  default = {
    test    = "{{ cookiecutter.aws_role_arn }}"
    dev     = "{{ cookiecutter.aws_role_arn }}"
    stage   = "{{ cookiecutter.aws_role_arn }}"
    preprod = "{{ cookiecutter.aws_role_arn }}"
    prod    = "{{ cookiecutter.aws_role_arn }}"
  }
  type = map(any)
}
