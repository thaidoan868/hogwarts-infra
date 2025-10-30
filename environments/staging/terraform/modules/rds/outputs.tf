output "postgres_address" {
  description = "RDS instance connection details"
  value = aws_db_instance.postgres.address
}

output "postgres_port" {
  description = "RDS instance port"
  value       = aws_db_instance.postgres.port
}