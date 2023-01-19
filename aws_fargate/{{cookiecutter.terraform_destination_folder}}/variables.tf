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

variable "container_port" {
  description = "Port number where the application runs in the container"
  type = number
  default = 8000
}

variable "host_port" {
  description = "Port number where the application it's going to be exposed to internet"
  type = number
  default = 80
}

variable "service_memory" {
  description = "Amount of memory to be allocated to the service"
  type = number
  default = 2048
}

variable "service_cpu" {
  description = "Amount of CPU to be allocated to the service"
  type = number
  default = 1024
}

variable "desired_count" {
  description = "Desired count of service instances"
  type = number
  default = 1
}
