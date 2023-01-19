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

resource "aws_ecs_task_definition" "task_definition" {
  family = "{{ cookiecutter.service_name }}"
  cpu       = var.service_cpu
  memory    = var.service_memory
  container_definitions = jsonencode([
    {
      name      = "{{ cookiecutter.service_name }}-container"
      image     = "nginx"
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]
    }
  ])
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]

}
