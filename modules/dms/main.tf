resource "aws_dms_replication_instance" "this" {
  replication_instance_id    = "${var.client_id}-dms-instance"
  allocated_storage          = var.allocated_storage
  replication_instance_class = var.instance_class
  engine_version             = var.engine_version
  vpc_security_group_ids     = [var.vpc_security_group_ids]
}

resource "aws_dms_endpoint" "source" {
  endpoint_id   = "${var.client_id}-source-endpoint"
  endpoint_type = "source"
  engine_name   = var.source_engine
  username      = var.source_username
  password      = var.source_password
  server_name   = var.source_server
  port          = var.source_port
}

resource "aws_dms_endpoint" "target" {
  endpoint_id   = "${var.client_id}-target-endpoint"
  endpoint_type = "target"
  s3_settings {
    bucket_name              = var.target_bucket_name
    service_access_role_arn  = aws_iam_role.dms_s3_role.arn
  }
}

resource "aws_dms_replication_task" "this" {
  replication_task_id      = "${var.client_id}-replication-task"
  migration_type           = "full-load-and-cdc"
  replication_instance_arn = aws_dms_replication_instance.this.replication_instance_arn
  source_endpoint_arn      = aws_dms_endpoint.source.endpoint_arn
  target_endpoint_arn      = aws_dms_endpoint.target.endpoint_arn
  table_mappings           = file("${path.module}/table-mappings.json")
}