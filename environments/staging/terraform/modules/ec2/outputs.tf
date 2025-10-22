output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.docker_ec2.public_ip
}

output "ecs_cluster" {
    description = "ECS Cluster ID"
    value       = aws_ecs_cluster.my_cluster
}