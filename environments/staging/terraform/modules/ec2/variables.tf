# Variables without default values
variable "ssh_security_group_id" {
  description = "Security group ID for SSH access"
  type        = string
}

# Variables with default values
variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t3.small"
}

variable "ami_id" {
#   aws ssm get-parameters \
# --names /aws/service/ecs/optimized-ami/amazon-linux-2023/recommended/image_id \
# --query 'Parameters[0].Value' --output text

description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ee7f8b6fb685d634"
}
