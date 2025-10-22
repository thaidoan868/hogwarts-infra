output "ecs_task_definition" {
  description = "The ECS task definition family"
  value       = aws_ecs_task_definition.hello_world_task.family
}
