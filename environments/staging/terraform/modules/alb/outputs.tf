# output "alb_dns_name" {
#   value       = aws_lb.hogwarts.
#   description = "Public DNS name of the ALB"
# }

output "hogwarts_app_target_group_id" {
  value       = aws_lb_target_group.hogwarts_app.id
  description = "Hogwarts App Target Group ID"
}
