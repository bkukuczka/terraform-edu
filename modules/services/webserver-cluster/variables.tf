variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}

variable "instance_type" {
  description = "Instance type of EC2 server"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-0faab6bdbac9486fb"
}

variable "server_text" {
  description = "Text displayed by server"
  type        = string
  default     = "Hello Terraform World"
}