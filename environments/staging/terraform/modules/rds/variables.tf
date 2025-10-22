variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
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
  default     = true
}

variable "allowed_cidrs" {
  description = "CIDR blocks allowed to connect to Postgres (5432). Use your-ip/32."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
