variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-0faab6bdbac9486fb"
}

variable "instance_type" {
  description = "Instance type of EC2 server"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Min amount of instances"
  type = number
}

variable "max_size" {
  description = "Max amount of instances"
  type = number
}

variable "enable_autoscaling" {
  description = "Should autoscaling be allowed"
  type = bool
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy to"
  type        = list(string)
}

variable "target_group_arns" {
  description = "The ARNs of ELB target groups in which to register Instances"
  type        = list(string)
  default     = []
}

variable "health_check_type" {
  description = "The type of health check to perform. Must be one of: EC2, ELB."
  type        = string
  default     = "EC2"
}

variable "user_data" {
  description = "The User Data script to run in each Instance at boot"
  type        = string
  default     = null
}