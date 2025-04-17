variable "client_id" {
  description = "Unique identifier for the client"
  type        = string
}

variable "source_engine" {
  description = "Source database engine"
  type        = string
}

variable "source_server" {
  description = "Source database server"
  type        = string
}

variable "source_username" {
  description = "Source database username"
  type        = string
  sensitive   = true
}

variable "source_password" {
  description = "Source database password"
  type        = string
  sensitive   = true
}

variable "source_port" {
  description = "Source database port"
  type        = number
  default     = 5432
}

variable "target_bucket_name" {
  description = "S3 bucket name for DMS target"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for DMS instance"
  type        = number
  default     = 100
}

variable "instance_class" {
  description = "DMS instance class"
  type        = string
  default     = "dms.t3.medium"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}