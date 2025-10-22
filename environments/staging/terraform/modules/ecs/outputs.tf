# terraform/ecs/outputs.tf

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = aws_ecs_cluster.ecs_cluster.name
}

output "ecs_task_definition" {
  description = "The ECS task definition family"
  value       = aws_ecs_task_definition.hello_world_task.family
}
