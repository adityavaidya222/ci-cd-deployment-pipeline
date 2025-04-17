variable "client_id" {
  description = "Unique identifier for the client"
  type        = string
}

variable "database_name" {
  description = "Name of the existing Redshift database"
  type        = string
}

variable "client_password" {
  description = "Password for the client-specific Redshift user"
  type        = string
  sensitive   = true
}

variable "security_group_id" {
  description = "Security group ID for Redshift"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Redshift"
  type        = string
}

variable "redshift_availability_zone" {
  description = "Availability zone of the existing Redshift cluster"
  type        = string
}