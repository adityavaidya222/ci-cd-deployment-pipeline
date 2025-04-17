variable "client_id" {
  description = "Unique identifier for the client"
  type        = string
  default     = "client_a"
}

variable "source_db_username" {
  description = "Source database username"
  type        = string
  sensitive   = true
}

variable "source_db_password" {
  description = "Source database password"
  type        = string
  sensitive   = true
}

variable "redshift_password" {
  description = "Redshift master password"
  type        = string
  sensitive   = true
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the VPC"
  type        = list(string)
}

variable "subnet_id" {
  description = "Subnet ID for resources"
  type        = string
}