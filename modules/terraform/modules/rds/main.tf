data "aws_vpc" "default" {
  default = true  // get the default VPC
}

data "aws_subnets" "default" {
  filter { // tell terraform to filter the api results
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_db_subnet_group" "this" { // define subnet group for RDS
  name       = "postgres-default-subnets"
  subnet_ids = data.aws_subnets.default.ids
}

resource "aws_security_group" "postgres" {
  name        = "postgres-rds-sg"
  description = "Allow PostgreSQL inbound"
  vpc_id      = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.allowed_cidrs
    content {
      description = "Allow access to Postgres Database from ${ingress.value}"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
  identifier           = "hogwarts-postgres"
  engine               = "postgres"
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage

  db_name              = var.db_name
  username             = var.username
  password             = var.password

  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [
    aws_security_group.postgres.id
  ]

  publicly_accessible  = var.publicly_accessible  // provide a public ip address
  multi_az             = false
  storage_type         = "gp2"

  backup_retention_period = 0
  deletion_protection     = false
  skip_final_snapshot     = true
  apply_immediately       = true

  tags = {
    Name = "postgres"
    Env  = "staging"
  }
}
