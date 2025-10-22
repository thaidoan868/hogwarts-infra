resource "aws_ecs_task_definition" "hello_world_task" {
  family                   = "hello-world-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([{
    name      = "hello-world"
    image     = "crccheck/hello-world"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = 8000
        hostPort      = 80
        protocol      = "tcp"
      }
    ]
  }])
}

module "ec2" {
  source = "../ec2"
}

resource "aws_ecs_service" "hello_world_service" {
  name            = "hello-world-service"
  cluster         = module.ec2.ecs_cluster.id
  task_definition = aws_ecs_task_definition.hello_world_task.arn
  desired_count   = 1
  launch_type     = "EC2"
}
