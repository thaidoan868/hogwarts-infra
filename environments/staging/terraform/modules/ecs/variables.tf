# Variables without default values
variable "default_subnet_ids" {
    description = "The IDs of the default AWS subnets"
    type        = list(string)
}

variable "hello_world_target_group_id" {
    description = "The ID of the Hello World target group"
    type        = string
}

variable "tasks_security_group_id" {
    description = "Security group ID for ECS tasks"
    type        = string
}