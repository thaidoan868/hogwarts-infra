# Variables without default values
variable "default_vpc_id" {
  description = "VPC where the ALB and target group live"
  type        = string
}

variable "default_subnet_ids" {
  description = "Subnets for the ALB (typically 2+ public subnets)"
  type        = list(string)
}

variable "http_security_group_id" {
    description = "Security group ID for ALB to allow HTTP traffic"
    type        = string
}


# Variables with default values
variable "target_group_name" {
  description = "Name of the Target Group"
  type        = string
  default     = "hogwarts-tg"
}


variable "health_check_path" {
  description = "Health check path for targets"
  type        = string
  default     = "/"
}

variable "health_check_interval" {
  description = "Seconds between health checks"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout in seconds for each health check"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Consecutive successes needed to mark healthy"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Consecutive failures needed to mark unhealthy"
  type        = number
  default     = 2
}

variable "enable_cross_zone" {
  description = "Enable cross-zone load balancing"
  type        = bool
  default     = true
}

variable "deregistration_delay" {
  description = "Seconds to wait for in-flight requests on deregistration"
  type        = number
  default     = 10
}

