# Variables without default values
variable "postgrest_security_group_id" {
  description = "Security group ID for PostgREST to access the database"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for the RDS instance"
  type        = list(string)
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}


# Variables with default values
variable "instance_class" {
  description = "RDS instance class (free-tier eligible)"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage in GB (free tier is up to 20GB)"
  type        = number
  default     = 10
}

variable "publicly_accessible" {
  description = "Whether the DB is reachable from the public internet"
  type        = bool
  default     = false
}
