variable "region" {
  description = "AWS region to target"
  type        = string
  default     = "ap-southeast-1"
  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-\\d+$", var.region))
    error_message = "Region must look like ap-southeast-1, us-east-1, etc."
  }
}