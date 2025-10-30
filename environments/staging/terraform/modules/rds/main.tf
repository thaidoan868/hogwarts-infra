resource "aws_db_subnet_group" "postgres" { // define subnet group for RDS
  name       = "postgres-subnets"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "postgres" {
  identifier           = "hogwarts-postgres"
  engine               = "postgres"
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage

  db_name              = var.db_name
  username             = var.username
  password             = var.password

  db_subnet_group_name = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [ var.postgrest_security_group_id]

  publicly_accessible  = var.publicly_accessible  // provide a public ip address
  multi_az             = false
  storage_type         = "gp2"

  backup_retention_period = 0
  deletion_protection     = false
  skip_final_snapshot     = true
  apply_immediately       = true
}
