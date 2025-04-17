module "dms" {
  source = "../../modules/dms"

  client_id               = "client_a"
  source_engine           = "postgres"
  source_server           = "client-db.example.com"
  target_bucket_name      = "client-a-dms-data"
  allocated_storage       = 100
  instance_class          = "dms.t3.medium"
}

module "glue" {
  source = "../../modules/glue"

  client_id              = "client_a"
  dms_bucket            = module.dms.target_bucket_name
  scripts_bucket        = "company-glue-scripts"
  redshift_connection_name = module.redshift.connection_name
}

module "redshift" {
  source = "../../modules/redshift"

  client_id       = "client_a"
  database_name   = "client_a_warehouse"
  master_username = "admin"
  master_password = var.redshift_password
}

module "lambda_reports" {
  source = "../../modules/lambda"

  client_id = "client_a"
  reports = {
    monthly_summary = {
      sheet_id = "1A2B3C4D..."
    }
    risk_analysis = {
      sheet_id = "5E6F7G8H..."
    }
  }
  lambda_code_bucket = "company-lambda-code"
  redshift_endpoint  = module.redshift.cluster_endpoint
}