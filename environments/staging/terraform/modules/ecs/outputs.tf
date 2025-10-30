output "ecs_task_definition_family" {
  description = "The ECS task definition"
  value       = aws_ecs_task_definition.hello_world.family
}

output "hello_world_service_name" {
    description = "The ECS service name"
    value       = aws_ecs_service.hello_world.name
}

output "hello_world_service_id" {
  description = "The ECS service id"
  value       = aws_ecs_service.hello_world.id
}