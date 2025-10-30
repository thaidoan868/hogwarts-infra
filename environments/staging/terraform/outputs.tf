# output "rds_endpoint" {
#   description = "RDS Endpoint"
#   value       = {
#     endpoint = module.rds.postgres_address
#     port     = module.rds.postgres_port
#   }
#   sensitive = true
# }
#
# output "ec2_public_ip" {
#     description = "RDS Host"
#     value       = module.ec2.instance_public_ip
# }
#
# output "ec2_instance_id" {
#     description = "EC2 Instance ID"
#     value       = module.ec2.instance_id
# }
#
# output "hello_world_service_id" {
#     description = "ECS Service ID"
#     value       = module.ecs.hello_world_service_id
# }