resource "aws_ecs_cluster" "hogwarts" {
  name = "hogwarts-cluster"
}

resource "aws_ecs_task_definition" "hello_world" {
  family                   = "hello-world-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([{
    name      = "hello-world"
    image     = "crccheck/hello-world"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [{ containerPort = 8000, protocol = "tcp" }]
  }])
}

resource "aws_ecs_service" "hello_world" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.hogwarts.id
  task_definition = aws_ecs_task_definition.hello_world.id
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = var.hello_world_target_group_id
    container_name   = "hello-world"
    container_port   = 8000
  }

  network_configuration {
    subnets         = var.default_subnet_ids
    security_groups = [var.tasks_security_group_id]  // 8000 and 8080 open
  }
}