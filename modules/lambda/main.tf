resource "aws_lambda_function" "report" {
  for_each = var.reports

  function_name = "${var.client_id}-${each.key}-report"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_role.arn

  environment {
    variables = {
      REDSHIFT_ENDPOINT = var.redshift_endpoint
      SCHEMA_NAME       = var.client_id
      GOOGLE_SHEET_ID   = each.value.sheet_id
    }
  }

  s3_bucket = var.lambda_code_bucket
  s3_key    = "${var.client_id}/${each.key}.zip"
}