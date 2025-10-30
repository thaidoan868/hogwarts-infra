# output "alb_dns_name" {
#   value       = aws_lb.hogwarts.
#   description = "Public DNS name of the ALB"
# }

output "hello_world_target_group_id" {
  value       = aws_lb_target_group.hello_world.id
  description = "Hello World Target Group ID"
}
