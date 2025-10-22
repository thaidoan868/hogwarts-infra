variable "region" {
  description = "The AWS region to deploy resources"
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for Amazon Linux 2"
  default     = "ami-0c55b159cbfafe1f0"
}
