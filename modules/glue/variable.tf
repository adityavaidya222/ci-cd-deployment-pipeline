variable "client_id" {
  description = "Unique identifier for the client"
  type        = string
}

variable "dms_bucket" {
  description = "S3 bucket name for DMS data"
  type        = string
}

variable "scripts_bucket" {
  description = "S3 bucket name for Glue scripts"
  type        = string
}

variable "redshift_connection_name" {
  description = "Name of the Redshift connection"
  type        = string
}