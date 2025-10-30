# Variables without default values
variable "default_subnet_ids" {
    description = "The IDs of the default AWS subnets"
    type        = list(string)
}

variable "hogwarts_app_target_group_id" {
    description = "The ID of the Hogwarts App target group"
    type        = string
}

variable "tasks_security_group_id" {
    description = "Security group ID for ECS tasks"
    type        = string
}

variable "spring_profiles_active" {
    description = "Active Spring profiles for the application"
    type        = string
    default = "staging"
}