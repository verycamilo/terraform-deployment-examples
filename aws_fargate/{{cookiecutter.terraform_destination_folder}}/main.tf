resource "aws_ecs_cluster" "cluster" {
  name = "{{ cookiecutter.cluster_name }}"
}

resource "aws_ecs_cluster_capacity_providers" "cluster_capacity" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = ["{{ cookiecutter.cluster_capacity_provider }}"]

  default_capacity_provider_strategy {
    base              = var.capacity_provider_strategy_base
    weight            = var.capacity_provider_strategy_weight
    capacity_provider = "{{ cookiecutter.cluster_capacity_provider }}"
  }
}