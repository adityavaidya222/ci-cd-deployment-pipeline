resource "aws_glue_job" "supervisor" {
  name     = "${var.client_id}-supervisor-job"
  role_arn = aws_iam_role.glue_role.arn

  command {
    script_location = "s3://${var.scripts_bucket}/${var.client_id}/supervisor.py"
  }

  default_arguments = {
    "--redshift_connection" = var.redshift_connection_name
    "--s3_path"            = "s3://${var.dms_bucket}/"
    "--schema_name"        = var.client_id
  }
}

resource "aws_glue_job" "cdc" {
  name     = "${var.client_id}-cdc-job"
  role_arn = aws_iam_role.glue_role.arn

  command {
    script_location = "s3://${var.scripts_bucket}/${var.client_id}/cdc.py"
  }

  default_arguments = {
    "--redshift_connection" = var.redshift_connection_name
    "--schema_name"        = var.client_id
  }
}