resource "aws_ecs_cluster" "hogwarts" {
  name = "hogwarts-cluster"
}

resource "aws_ecs_task_definition" "hogwarts-app" {
  family                   = "hogwarts-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([{
    name      = "hogwarts-app"
    image     = "thaidoan868/hogwarts-app:0.1"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [{ containerPort = 8081, protocol = "tcp" }]
    environment = [
      {
        name  = "SPRING_PROFILES_ACTIVE",
        value = var.spring_profiles_active
      }
    ]
  }])
}

resource "aws_ecs_service" "hogwarts-app" {
  name            = "hogwarts-app-service"
  cluster         = aws_ecs_cluster.hogwarts.id
  task_definition = aws_ecs_task_definition.hogwarts-app.id
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = var.hogwarts_app_target_group_id
    container_name   = "hogwarts-app"
    container_port   = 8081
  }

  network_configuration {
    subnets         = var.default_subnet_ids
    security_groups = [var.tasks_security_group_id]
  }
}