output "output" {
  description = "RDS instance connection details"
  value = {
    vpc_cidr_range     = data.aws_vpc.default.cidr_block
    endpoint           = aws_db_instance.postgres.address
    port               = aws_db_instance.postgres.port
    db_name            = aws_db_instance.postgres.db_name
    security_group_id  = aws_security_group.postgres.id
  }
  sensitive = true
}