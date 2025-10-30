output "default_vpc_id" {
  description = "The ID of the default VPC"
  value       = data.aws_vpc.default.id
}

output "default_subnet_ids" {
  description = "The IDs of the default subnets"
  value       = data.aws_subnets.default.ids
}

output "postgres_security_group_id" {
  description = "The ID of the PostgREST security group"
  value       = aws_security_group.postgres.id
}

output "ssh_security_group_id" {
  value = aws_security_group.ssh.id
}

output "http_security_group_id" {
  value = aws_security_group.http.id
}

output "tasks_security_group_id" {
  value = aws_security_group.tasks.id
}

output "https_security_group_id" {
  value = aws_security_group.https.id
}