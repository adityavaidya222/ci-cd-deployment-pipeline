variable "client_id" {
  description = "Unique identifier for the client"
  type        = string
}

variable "reports" {
  description = "Map of reports with their configuration"
  type = map(object({
    sheet_id = string
  }))
}

variable "lambda_code_bucket" {
  description = "S3 bucket containing Lambda code"
  type        = string
}

variable "redshift_endpoint" {
  description = "Redshift cluster endpoint"
  type        = string
}