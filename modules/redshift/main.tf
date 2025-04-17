resource "aws_redshift_schema" "client_schema" {
  schema_name = var.client_id
  database    = var.database_name
}

resource "aws_redshift_user" "client_user" {
  username = "${var.client_id}_user"
  password = var.client_password
}

resource "aws_redshift_grant" "schema_access" {
  schema_name = aws_redshift_schema.client_schema.schema_name
  user_name   = aws_redshift_user.client_user.username
  privileges  = ["CREATE", "USAGE"]
}

resource "aws_glue_connection" "redshift" {
  name = "${var.client_id}-redshift-connection"

  physical_connection_requirements {
    availability_zone      = var.redshift_availability_zone
    security_group_id_list = [var.security_group_id]
    subnet_id              = var.subnet_id
  }
}